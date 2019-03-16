# ============================================================================
# FILE: base.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

# For backward compatibility
from denite.base.filter import Base as _Base


class Base(_Base):
    def __init__(self, vim):
        super().__init__(vim)
