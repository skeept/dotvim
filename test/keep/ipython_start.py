import os
import sys
from pathlib import Path
import threading

np = None
pd = None
sk = None
tf = None


def _load_pandas():
    try:
        global pd
        import pandas as pd_

        pd = pd_
    except ImportError:
        sys.stderr.write("cannot imort pandas\n")

    try:
        global np
        import numpy as np_

        np = np_
    except ImportError:
        sys.stderr.write("cannot import numpy\n")

    try:
        global sk
        import sklearn as sk_

        sk = sk_
    except ImportError:
        sys.stderr.write("cannot import sklearn\n")

    try:
        global tf
        import tensorflow as tf_

        tf = tf_
    except ImportError:
        sys.stderr.write("cannot import tensorflow\n")


threading.Thread(target=_load_pandas).start()
