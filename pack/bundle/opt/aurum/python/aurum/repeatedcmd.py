from aurum.utils import readsystem
import time

# Threads do not run in vim on ARM linux. Have to use processes instead.
use_threads=False

if use_threads:
    from multiprocessing import Value
    from Queue import Queue
    from threading import Lock
    from threading import Thread as Process
    def use_default_signal_handlers():
        pass
else:
    from multiprocessing import Process, Queue, Value, Lock
    from signal import signal, NSIG, SIG_DFL
    def use_default_signal_handlers():
        for sig in range(NSIG):
            try:
                signal(sig, SIG_DFL)
            except Exception:
                pass

class ProcessHaltedError(Exception):
    pass

notalive = 'Child process is not alive or is exiting'

class RepeatedCmd(object):
    __slots__ = set(('interval', 'queue', 'qlock', 'vlock', 'func', 'process',
                     'value', 'args', 'kwargs', 'paused', 'curinterval'))
    def __init__(self, interval, func, *args, **kwargs):
        self.curinterval = float(interval)
        self.interval    = Value('f', self.curinterval)
        self.queue       = Queue()
        self.vlock       = Lock()
        self.qlock       = Lock()
        self.func        = func
        self.args        = args
        self.kwargs      = kwargs
        self.value       = None
        self.process     = None

        self.start()

    def setinterval(self, interval):
        if not self.alive():
            raise ProcessHaltedError(notalive)
        self.curinterval    = float(interval)
        self.interval.value = self.curinterval

    def getvalue(self):
        if not self.alive():
            result = self.getcurrentvalue()
            self.start()
            return result

        self.qlock.acquire()
        if self.value is None or not self.queue.empty():
            while(not self.queue.empty()):
                self.value = self.queue.get()
        self.qlock.release()
        return self.value

    def getcurrentvalue(self):
        self.vlock.acquire()
        self.qlock.acquire()
        if self.value is None or not self.queue.empty():
            while(not self.queue.empty()):
                self.queue.get()
        self.qlock.release()
        self.value = self.func(*self.args, **self.kwargs)
        self.vlock.release()
        return self.value

    def alive(self):
        return (    self.process is not None
                and self.process.is_alive()
                and self.interval.value > 0.0)

    def join(self):
        if (    self.process is not None
            and self.process.is_alive()
            and self.interval.value <= 0.0):
            self.process.join()

    def run(self):
        # Override default signal vim handlers with system default behavior 
        # (i.e. terminate or ignore), especially SIGTERM. Without this hack 
        # process.terminate() may leave the process alive. Bad, I do not know 
        # why it leaves it alive only in some limited set of cases.
        use_default_signal_handlers()
        while self.interval.value > 0.0:
            starttime = time.clock()
            self.vlock.acquire()
            value     = self.func(*self.args, **self.kwargs)
            self.vlock.release()
            self.qlock.acquire()
            # If I only knew the size of func() output I would have used 
            # Value()
            while(not self.queue.empty()):
                self.queue.get()
            self.queue.put(value)
            self.qlock.release()
            try:
                time.sleep(self.interval.value-(time.clock()-starttime))
            except Exception:
                # Work when interval-elapsed results in negative value.
                pass

    def start(self):
        if self.alive():
            return
        self.join()
        self.process = Process(target=self.run)
        self.process.start()

    def stop(self):
        if not self.alive():
            return
        # For some reason process.terminate() sometimes may not seem to work. 
        # This is a workaround. Seems it is no longer needed with 
        # self.process.join(), just keeping it here for multiprocessing.

        # For threading this is the only way to terminate thread (use old 
        # implementation based on sequence of timers?)
        self.interval.value = -1.0
        try:
            self.process.terminate()
            # Anti-zombie code
            self.process.join()
        except AttributeError:
            # Threads do not have .terminate method
            pass

    pause   = stop
    resume  = start
    __del__ = stop

class RepeatedCmdSynchronized(object):
    def __init__(self, interval, func, *args, **kwargs):
        self.args   = args
        self.kwargs = kwargs
        self.func   = func

    def getvalue(self):
        return self.func(*self.args, **self.kwargs)

    getcurrentvalue = getvalue

    @staticmethod
    def dummy():
        pass

    stop = dummy
    pause = dummy
    resume = dummy

# RepeatedCmd = RepeatedCmdSynchronized

processes={}

thcount=0

def new(*args, **kwargs):
    global processes
    global thcount
    rcid=thcount
    thcount+=1
    processes[rcid]=RepeatedCmd(*args, **kwargs)
    return rcid

def get(rcid, now=False):
    global processes
    if now:
        return processes[rcid].getcurrentvalue()
    else:
        return processes[rcid].getvalue()

def remove(rcid):
    global processes
    process=processes.pop(rcid)
    process.stop()

def finish():
    global processes
    for process in processes.values():
        process.stop()
    processes={}

def pause(rcid):
    global processes
    processes[rcid].pause()

def resume(rcid):
    global processes
    processes[rcid].resume()

def summary():
    global processes
    for rcid in processes:
        process=processes[rcid]
        print ('%*s: %s %u %s' %
               (len(processes), rcid, '+' if process.alive() else '-',
                process.process.pid, repr(process.args)))
