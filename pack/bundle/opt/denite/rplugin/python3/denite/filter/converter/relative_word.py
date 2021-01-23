# ============================================================================
# FILE: converter/relative_word.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from pathlib import Path
from pynvim import Nvim

from denite.base.filter import Base
from denite.util import relpath, UserContext, Candidates


class Filter(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'converter/relative_word'
        self.description = 'convert candidate word to relative path'

    def filter(self, context: UserContext) -> Candidates:
        for candidate in context['candidates']:
            if Path(candidate['word']).is_absolute():
                candidate['word'] = relpath(
                    self.vim,
                    candidate.get('action__path', candidate['word']))
        return list(context['candidates'])
