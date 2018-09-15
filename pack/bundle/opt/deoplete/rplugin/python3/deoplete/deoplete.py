# ============================================================================
# FILE: deoplete.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

import copy
import glob
import os
import time

import deoplete.parent
from deoplete import logger
from deoplete.util import error, error_tb


class Deoplete(logger.LoggingMixin):

    def __init__(self, vim):
        self.name = 'core'

        self._vim = vim
        self._runtimepath = ''
        self._runtimepath_list = []
        self._custom = []
        self._loaded_paths = set()
        self._prev_results = {}
        self._prev_input = ''
        self._prev_next_input = ''

        self._parents = []
        self._parent_count = 0
        self._max_parents = self._vim.call('deoplete#custom#_get_option',
                                           'num_processes')

        if self._max_parents != 1 and not hasattr(self._vim, 'loop'):
            msg = ('neovim-python 0.2.4+ is required for %d parents. '
                   'Using single process.' % self._max_parents)
            error(self._vim, msg)
            self._max_parents = 1

        # Enable logging for more information, and e.g.
        # deoplete-jedi picks up the log filename from deoplete's handler in
        # its on_init.
        if self._vim.vars['deoplete#_logging']:
            self.enable_logging()

        # Initialization
        context = self._vim.call('deoplete#init#_context', 'Init', [])
        context['rpc'] = 'deoplete_on_event'
        self.on_event(context)

        if hasattr(self._vim, 'channel_id'):
            self._vim.vars['deoplete#_channel_id'] = self._vim.channel_id
        self._vim.vars['deoplete#_initialized'] = True

    def enable_logging(self):
        logging = self._vim.vars['deoplete#_logging']
        logger.setup(self._vim, logging['level'], logging['logfile'])
        self.is_debug_enabled = True

    def completion_begin(self, context):
        self.debug('completion_begin (%s): %r',
                   context['event'], context['input'])

        self._check_recache(context)

        try:
            is_async, position, candidates = self._merge_results(context)
        except Exception:
            error_tb(self._vim, 'Error while gathering completions')

            is_async = False
            position = -1
            candidates = []

        if is_async:
            self._vim.call('deoplete#handler#_async_timer_start')
        else:
            self._vim.call('deoplete#handler#_async_timer_stop')

        if not candidates and ('deoplete#_saved_completeopt'
                               in context['vars']):
            self._vim.call('deoplete#mapping#_restore_completeopt')

        # Async update is skipped if same.
        prev_completion = context['vars']['deoplete#_prev_completion']
        prev_candidates = prev_completion['candidates']
        if (context['event'] == 'Async' and
                prev_candidates and len(candidates) <= len(prev_candidates)):
            return

        # error(self._vim, candidates)
        self._vim.vars['deoplete#_context'] = {
            'complete_position': position,
            'candidates': candidates,
            'event': context['event'],
            'input': context['input'],
            'is_async': is_async,
        }
        self.debug('calling deoplete#handler#_do_complete:'
                   + ' %d candidates, complete_position=%d, is_async=%d',
                   len(candidates), position, is_async)
        self._vim.call('deoplete#handler#_do_complete')

    def on_event(self, context):
        self.debug('on_event: %s', context['event'])
        self._check_recache(context)

        for parent in self._parents:
            parent.on_event(context)

    def _get_results(self, context):
        is_async = False
        results = []
        for cnt, parent in enumerate(self._parents):
            if cnt in self._prev_results:
                # Use previous result
                results += copy.deepcopy(self._prev_results[cnt])
            else:
                result = parent.merge_results(context)
                is_async = is_async or result[0]
                if not result[0]:
                    self._prev_results[cnt] = result[1]
                results += result[1]
        return [is_async, results]

    def _merge_results(self, context):
        use_prev = (context['input'] == self._prev_input
                    and context['next_input'] == self._prev_next_input
                    and context['event'] != 'Manual')
        if not use_prev:
            self._prev_results = {}

        self._prev_input = context['input']
        self._prev_next_input = context['next_input']

        start = time.time()
        timeout = int(self._vim.call('deoplete#custom#_get_option',
                                     'async_timeout')) / 1000.0
        while 1:
            [is_async, results] = self._get_results(context)
            if not is_async or (time.time() - start > timeout):
                break
            time.sleep(0.01)

        if not results:
            return (is_async, -1, [])

        complete_position = min(x['complete_position'] for x in results)

        all_candidates = []
        for result in sorted(results, key=lambda x: x['rank'], reverse=True):
            candidates = result['candidates']
            prefix = context['input'][
                complete_position:result['complete_position']]

            if prefix != '':
                for candidate in candidates:
                    # Add prefix
                    candidate['word'] = prefix + candidate['word']

            all_candidates += candidates

        # self.debug(candidates)
        max_list = self._vim.call('deoplete#custom#_get_option', 'max_list')
        if max_list > 0:
            all_candidates = all_candidates[: max_list]

        return (is_async, complete_position, all_candidates)

    def _add_parent(self, parent_cls):
        parent = parent_cls(self._vim)
        if self._vim.vars['deoplete#_logging']:
            parent.enable_logging()
        self._parents.append(parent)

    def _init_parents(self):
        if self._parents or self._max_parents <= 0:
            return

        if self._max_parents == 1:
            self._add_parent(deoplete.parent.SingleParent)
        else:
            for n in range(0, self._max_parents):
                self._add_parent(deoplete.parent.MultiParent)

    def _find_rplugins(self, source):
        """Search for base.py or *.py

        Searches $VIMRUNTIME/*/rplugin/python3/deoplete/$source[s]/
        """
        if not self._runtimepath_list:
            return

        sources = (
            os.path.join('rplugin', 'python3', 'deoplete',
                         source, 'base.py'),
            os.path.join('rplugin', 'python3', 'deoplete',
                         source, '*.py'),
            os.path.join('rplugin', 'python3', 'deoplete',
                         source + 's', '*.py'),
            os.path.join('rplugin', 'python3', 'deoplete',
                         source, '*', '*.py'),
        )

        for src in sources:
            for path in self._runtimepath_list:
                yield from glob.iglob(os.path.join(path, src))

    def _load_sources(self, context):
        self._init_parents()

        for path in self._find_rplugins('source'):
            if path in self._loaded_paths:
                continue
            self._loaded_paths.add(path)

            if self._max_parents <= 0:
                # Add parent automatically for num_processes=0.
                self._add_parent(deoplete.parent.MultiParent)

            self._parents[self._parent_count].add_source(path)
            self.debug('Process %d: %s', self._parent_count, path)

            self._parent_count += 1
            if self._max_parents > 0:
                self._parent_count %= self._max_parents

        self._set_source_attributes(context)

    def _load_filters(self, context):
        for path in self._find_rplugins('filter'):
            for parent in self._parents:
                parent.add_filter(path)

    def _set_source_attributes(self, context):
        for parent in self._parents:
            parent.set_source_attributes(context)

    def _check_recache(self, context):
        runtimepath = self._vim.options['runtimepath']
        if runtimepath != self._runtimepath:
            self._runtimepath = runtimepath
            self._runtimepath_list = runtimepath.split(',')
            self._load_sources(context)
            self._load_filters(context)

            if context['rpc'] != 'deoplete_on_event':
                self.on_event(context)
        elif context['custom'] != self._custom:
            self._set_source_attributes(context)
            self._custom = context['custom']
