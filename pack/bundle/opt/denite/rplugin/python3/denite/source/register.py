# ============================================================================
# FILE: register.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

import re

from denite.base.source import Base
from denite.util import Nvim, UserContext, Candidates


class Source(Base):

    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'register'
        self.kind = 'word'

    def gather_candidates(self, context: UserContext) -> Candidates:
        candidates = []

        for reg in (['+', '*']
                    if self.vim.call('has', 'clipboard') else []) + [
           '"',
           '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
           'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
           'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
           'u', 'v', 'w', 'x', 'y', 'z',
           '-', '.', ':', '#', '%', '/', '=']:
            register = self.vim.call('denite#util#getreg', reg)
            if not register:
                continue

            candidates.append({
                'word': reg + ': ' + re.sub(
                    r'\n', r'\\n', register)[:200],
                'action__text': register,
            })
        return candidates
