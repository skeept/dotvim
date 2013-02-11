from aurum.utils   import readlines
from aurum.auutils import emptystatdct

hgstatchars={
    'M': 'modified',
    'A': 'added',
    'R': 'removed',
    '!': 'deleted',
    '?': 'unknown',
    'I': 'ignored',
    'C': 'clean',
}

def hg_status(path, args, reverse=False):
    r=emptystatdct()
    for line in readlines(['hg', 'status']+args, cwd=path):
        r[hgstatchars[line[0]]].append(line[2:])
    if reverse:
        r['deleted'], r['unknown'] = r['unknown'], r['deleted']
        r['added'],   r['removed'] = r['removed'], r['added']
    return r

def hg_branch(path):
    return readlines(['hg', 'branch'], cwd=path).next()

def git_status(path, fname):
    r=emptystatdct()
    try:
        line=readlines(['git', 'status', '--porcelain', '--', fname],
                       cwd=path).next()
        status=line[:2]
        if status[0] in 'RC':
            r['added'].append(fname)
        elif status[0] == 'D':
            r['removed'].append(fname)
        elif status[1] == 'D':
            r['deleted'].append(fname)
        elif status[0] == 'A':
            r['added'].append(fname)
        elif 'M' in status:
            r['modified'].append(fname)
        elif status == '??':
            r['unknown'].append(fname)
    except StopIteration:
        try:
            readlines(['git', 'ls-files', '--ignored', '--exclude-standard',
                       '--others', '--', fname], cwd=path).next()
            r['ignored'].append(fname)
        except StopIteration:
            try:
                readlines(['git', 'ls-files', '--', fname], cwd=path).next()
                r['clean'].append(fname)
            except StopIteration:
                pass
    return r

def git_branch(path):
    for line in readlines(['git', 'branch', '-l'], cwd=path):
        if line[0] == '*':
            return line[2:]
    return ''

svnstatchars=[
    {
        'C': 'modified',
        'M': 'modified',
        '~': 'modified',
        'R': 'modified',
        'A': 'added',
        'D': 'removed',
        '!': 'deleted',
        '?': 'unknown',
        'I': 'ignored',
    },
    {
        'C': 'modified',
        'M': 'modified',
    },
]
def svn_status(path, fname):
    r=emptystatdct()
    try:
        line=readlines(['svn', 'status', '--', fname], cwd=path).next()
        status=line[:7]
        for schar, colschars in zip(status, svnstatchars):
            if schar in colschars:
                r[colschars[schar]].append(fname)
                break
    except StopIteration:
        r['clean'].append(fname)
    return r

bzrstatstats={
    'added'       : 'added',
    'removed'     : 'removed',
    'renamed'     : 'removed',
    'modified'    : 'modified',
    'kind changed': 'modified',
    'conflicts'   : 'modified',
    'unknown'     : 'unknown',
    'nonexistent' : 'unknown',
    'missing'     : 'deleted',
    'ignored'     : 'ignored',
}

def bzr_status(path, fname):
    r=emptystatdct()
    try:
        line=readlines(['bzr', 'status', '--', fname], cwd=path).next()
        if line[-1] != ':':
            raise ValueError('Expected colon at the end of first line')
        line=line[:-1]
        if line != 'nonexistent':
            r[bzrstatstats[line]].append(fname)
    except StopIteration:
        r['clean'].append(fname)
    return r

def bzr_branch(path):
    return "\n".join(readlines(['bzr', 'nick'], cwd=path))

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
