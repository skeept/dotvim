from __future__ import absolute_import
from importlib import import_module
from collections import namedtuple
from time import time
import aurum.rcdriverfuncs as rcdfuncs
import aurum.repeatedcmd as rc
import vim
from os.path import dirname, isdir, join, relpath
from powerline.theme import requires_segment_info
from powerline.bindings.vim import getbufvar, vim_get_func
from powerline.lib.memoize import memoize

Funcs = namedtuple('Funcs', 'branch status')
dummy_func = lambda *args : None
dummy_funcs = Funcs(dummy_func, dummy_func)
vcss = {}

def generate_status_func(g_repo, status_func):
    def status(path, fname):
        try:
            status = status_func(path, files=(relpath(fname, path),), ignored=True)
        except:
            return None
        for k, v in status.iteritems():
            if v:
                return k
        return None
    return status

def generate_branch_func(g_repo, branch_func):
    def branch(path):
        return branch_func(g_repo(path))
    return branch

func_generators = {
    'status': generate_status_func,
    'branch': generate_branch_func,
}

def specialize(funcs, path):
    def status(fname):
        return funcs.status(path, fname)
    def branch():
        return funcs.branch(path)
    return Funcs(status=status, branch=branch)

funcs_cache = {}
fname_cache = {}

def plugin_eval(expr):
    global plugin_eval
    plugin_eval = vim_get_func('<SNR>'+sid+'_Eval')
    return plugin_eval(expr)

if hasattr(vim, 'bindeval'):
    self_dict = vim.bindeval('{}')

    def get_repo(path):
        global get_repo
        vim_get_repo = plugin_eval('s:_r.repo.get')
        get_repo = lambda path: vim_get_repo(path, self=self_dict)
        return get_repo(path)

    def get_interval(key):
        global get_interval
        vim_get_interval = plugin_eval('s:_r.cache.getinterval')
        get_interval = lambda key: vim_get_interval(key, self=self_dict)
        return get_interval(key)

    rf_dict = vim.bindeval('{"repo": ":"}')

    def get_rrf():
        global get_rrf
        vim_get_rrf = plugin_eval('s:_r.cmdutils.getrrf')
        get_rrf = lambda : list(vim_get_rrf(rf_dict, 0, 'getsilent', self=self_dict))[1:]
        return get_rrf()

    # bufvars = plugin_eval('')

else:
    import json
    def get_repo(path):
        return plugin_eval('s:_r.repo.get('+json.dumps(path)+')')

    def get_interval(key):
        return float(plugin_eval('s:_r.cache.getinterval("'+key+'")'))

    def get_rrf():
        return plugin_eval('s:_r.cmdutils.getrrf({"repo": ":"}, 0, "getsilent")[1:]')

def get_rf(bufnr):
    global funcs_cache
    global fname_cache

    if bufnr in fname_cache and (time()-fname_cache[bufnr][1]) < get_repo_interval():
        return funcs_cache[bufnr][0], fname_cache[bufnr][0]

    try:
        vim_repo, rev, fname = get_rrf()
    except:
        vim_repo = None
        fname = None

    funcs = process_repo(vim_repo)

    if not fname or fname == '0':
        fname = None

    set_bufnr_cache(funcs_cache, bufnr, funcs)
    set_bufnr_cache(fname_cache, bufnr, fname)

    return funcs, fname

repo_interval = None

def get_repo_interval():
    global repo_interval
    global get_repo_interval
    repo_interval = get_interval('repo')
    get_repo_interval = lambda : repo_interval
    return repo_interval

def set_bufnr_cache(cache_dict, bufnr, value):
    cache_dict[bufnr] = (value, time())
    return value

def process_repo(vim_repo):
    try:
        path = vim_repo['path']
    except TypeError:
        return None

    vcs = vim_repo['type'].lower()
    try:
        if vcs not in vcss:
            try:
                module = import_module('aurum.au'+vcs)
            except:
                module = None

            try:
                status_func = func_generators['status'](module.g_repo, getattr(module, '_get_status'))
            except AttributeError:
                try:
                    status_func = getattr(rcdfuncs, vcs+'_status')
                except AttributeError:
                    status_func = dummy_func

            try:
                branch_func = func_generators['branch'](module.g_repo,
                                                        getattr(module, 'repo_props')['branch'])
            except AttributeError, KeyError:
                try:
                    branch_func = getattr(rcdfuncs, vcs+'_branch')
                except AttributeError:
                    branch_func = dummy_func

            vcss[vcs] = Funcs(status=status_func, branch=branch_func)
        return specialize(vcss[vcs], path)
    except:
        return None

def guess(bufnr):
    global funcs_cache

    if bufnr in funcs_cache and (time()-funcs_cache[bufnr][1]) < get_repo_interval():
        return funcs_cache[bufnr][0]

    try:
        vim_repo = get_repo(':')
    except:
        vim_repo = None

    return set_bufnr_cache(funcs_cache, bufnr, process_repo(vim_repo))

buffers = {}
started = False

def wipe_buffer(bufnr):
    if bufnr in buffers:
        for value in buffers[bufnr]['rcids'].itervalues():
            rc.remove(value)
        buffers.pop(bufnr)

def wipe_key(key):
    for bdict in buffers.itervalues():
        if key in bdict['rcids']:
            rc.get(bdict['rcids'][key], now=True)

def wipe_buffer_key(bufnr, key):
    if bufnr in buffers and key in buffers[bufnr]['rcids']:
        rc.get(buffers[bufnr]['rcids'][key], now=True)

def switch():
    active_buffers = set((w.buffer.number for w in vim.windows if w.buffer.number in buffers))
    for bufnr in buffers:
        if bufnr not in active_buffers:
            rcids = buffers[bufnr]['rcids']
            for rcid in rcids.itervalues():
                rc.remove(rcid)
            rcids.clear()
            if 'funcs' in buffers[bufnr]:
                buffers[bufnr].pop('funcs')

def setup_buffer(bufnr, func_name, funcs=None, *args):
    if not started:
        vim.eval('FraworLoad(@%aurum/powerline)')

    newbuffer = (bufnr not in buffers)
    if newbuffer:
        bdict = {'rcids': {}}
        buffers[bufnr] = bdict
    else:
        bdict = buffers[bufnr]

    if not funcs:
        if 'funcs' in bdict:
            funcs = bdict['funcs']
        else:
            funcs = guess(bufnr)
            bdict['funcs'] = funcs
    else:
        bdict['funcs'] = funcs

    if not funcs:
        return None

    if func_name not in bdict['rcids']:
        bdict['rcids'][func_name] = rc.new(get_interval(func_name), getattr(funcs, func_name), *args)
        if func_name == 'status':
            vim.command('autocmd! AuRemovePowerlineRC BufWritePost <buffer='+str(bufnr)+'> '+
                    ':python aurum.powerline.wipe_buffer_key('+str(bufnr)+', '+repr(func_name)+')')
        if newbuffer:
            vim.command('autocmd! AuRemovePowerlineRC BufWipeOut,BufFilePost <buffer='+str(bufnr)+'> '+
                    ':python aurum.powerline.wipe_buffer('+str(bufnr)+')')


    return bdict['rcids'][func_name]

@requires_segment_info
def branch(pl, segment_info):
    bsetup = setup_buffer(segment_info['bufnr'], 'branch')
    if bsetup is None:
        return None
    return rc.get(bsetup)

@requires_segment_info
def file_vcs_status(pl, segment_info):
    if not segment_info['buffer'].name or getbufvar(segment_info['bufnr'], '&buftype'):
        return None

    funcs, fname = get_rf(segment_info['bufnr'])
    if not fname or not funcs:
        return None

    bsetup = setup_buffer(segment_info['bufnr'], 'status', funcs, fname)
    if bsetup is None:
        return None

    status = rc.get(bsetup)

    if not status or status == 'clean':
        return None

    statchar = status[0].upper()
    return [{
            'contents': statchar,
            'highlight': ['file_vcs_status_'+statchar, 'file_vcs_status']
           }]

persistent = lambda : memoize(100000, cache_key=lambda segment_info, **kwargs: segment_info['bufnr'])

@requires_segment_info
@persistent()
def annotated_changeset(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def status_changesets(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def diff_changesets(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def diff_files(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def log_options(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def repository_root(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def file_directory(pl, segment_info):
    pass

@requires_segment_info
@persistent()
def file_name(pl, segment_info):
    pass

def is_commit(matcher_info):
    return getbufvar(matcher_info['bufnr'], '&filetype') == 'aurumcommit'

def is_annotate(matcher_info):
    return getbufvar(matcher_info['bufnr'], '&filetype') == 'aurumannotate'

def is_status(matcher_info):
    return getbufvar(matcher_info['bufnr'], '&filetype') == 'aurumstatus'

def is_log(matcher_info):
    return getbufvar(matcher_info['bufnr'], '&filetype') == 'aurumlog'

sep = None

def is_file(matcher_info):
    global sep
    if not sep:
        sep = vim.eval('fnamemodify(".", ":p")')[-1]
    name = matcher_info['buffer'].name
    return name and name.startswith('aurum:'+sep+sep+'file:')

def is_diff(matcher_info):
    global sep
    if not sep:
        sep = vim.eval('fnamemodify(".", ":p")')[-1]
    name = matcher_info['buffer'].name
    return name and name.startswith('aurum:'+sep+sep+'diff:')

# vim: ft=python ts=4 sw=4 sts=4 et tw=120
