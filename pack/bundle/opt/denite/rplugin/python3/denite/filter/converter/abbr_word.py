# ============================================================================
# FILE: converter/abbr_word.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from pynvim import Nvim

from denite.base.filter import Base
from denite.util import UserContext, Candidates


class Filter(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'converter/abbr_word'
        self.description = 'convert candidate abbr to word'

    def filter(self, context: UserContext) -> Candidates:
        for candidate in context['candidates']:
            if 'abbr' in candidate:
                candidate['word'] = candidate['abbr']
        return list(context['candidates'])
