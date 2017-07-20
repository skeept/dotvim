# XXX This should throw an exception if it is unusable
from subprocess import Popen, PIPE
from sys import stderr
def readsystem(cmd, cwd=None):
    if not cwd:
        cwd=None
    p=Popen(cmd, shell=False, stdout=PIPE, stderr=PIPE, cwd=cwd)
    lines=[]
    lastnl=False
    for line in p.stdout:
        lastnl=(line[-1]=='\n')
        lines.append((line[:-1] if lastnl else line).replace('\0', '\n'))
    if lastnl:
        lines.append('')
    exit_code=p.wait()
    stderr.write(p.stderr.read())
    return lines, exit_code

def readlines(cmd, cwd=None):
    p=Popen(cmd, shell=False, stdout=PIPE, stderr=PIPE, cwd=cwd)
    p.stderr.close()
    for line in p.stdout:
        yield line[:-1]

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
