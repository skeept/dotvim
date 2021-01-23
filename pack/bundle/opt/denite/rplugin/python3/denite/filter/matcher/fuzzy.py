# ============================================================================
# FILE: matcher/fuzzy.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from pynvim import Nvim
import re

from denite.base.filter import Base
from denite.util import escape_fuzzy, convert2fuzzy_pattern
from denite.util import UserContext, Candidates


class Filter(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'matcher/fuzzy'
        self.description = 'fuzzy matcher'

    def filter(self, context: UserContext) -> Candidates:
        if context['input'] == '':
            return list(context['candidates'])
        pattern = context['input']
        if context['ignorecase']:
            pattern = pattern.lower()
        p = re.compile(escape_fuzzy(re.escape(pattern)))
        if context['ignorecase']:
            context['candidates'] = [x for x in context['candidates']
                                     if p.search(x['word'].lower())]
        else:
            context['candidates'] = [x for x in context['candidates']
                                     if p.search(x['word'])]
        return list(context['candidates'])

    def convert_pattern(self, input_str: str) -> str:
        return convert2fuzzy_pattern(input_str)
