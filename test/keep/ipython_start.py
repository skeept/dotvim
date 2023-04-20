# import os
import sys
import threading

# np = None
# pd = None
# sk = None
# tf = None
# Path = None

def _load_heavy():
    """Import on a thread."""
    global os
    import os

    global Path
    from pathlib import Path

    try:
        global pd
        import pandas as pd
    except ImportError:
        sys.stderr.write("cannot import pandas\n")

    try:
        global np
        import numpy as np
    except ImportError:
        sys.stderr.write("cannot import numpy\n")

    try:
        global sk
        import sklearn as sk
    except ImportError:
        sys.stderr.write("cannot import sklearn\n")

    # try:
        # global tf
        # import tensorflow as tf_
        # tf = tf_
    # except ImportError:
        # sys.stderr.write("cannot import tensorflow\n")

    try:
        global tf
        import tensorflow as tf
    except ImportError:
        sys.stderr.write("cannot import tensorflow\n")

    try:
        global rich
        import rich
        import functools
        global ii
        ii = functools.partial(rich.inspect, methods=True)
        global iih
        iih = functools.partial(rich.inspect, methods=True, help=True)
        global iia
        iia = functools.partial(rich.inspect, all=True)
    except ImportError:
        sys.stderr.write("cannot import rich\n")




threading.Thread(target=_load_heavy).start()
del _load_heavy
