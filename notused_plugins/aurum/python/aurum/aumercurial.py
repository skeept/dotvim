from mercurial import hg, ui, commands, match
try:
    from mercurial.repo import error
except ImportError:
    from mercurial import error
import vim
import os
import json
import re
import sys
from aurum.auutils import AurumError, outermethodgen, autoexportmethodgen, vim_extend, \
                          vim_throw, echoe, echom, get_repo_prop_gen

if hasattr(error, 'RepoLookupError'):
    RepoLookupError=error.RepoLookupError
else:
    RepoLookupError=error.RepoError

def flush(repo):
    repo.ui.flush()

def g_repo(path):
    try:
        return hg.repository(PrintUI(), path)
    except error.RepoError:
        vim_throw('norepo', path)

outermethod      = outermethodgen(g_repo, flush)
autoexportmethod = autoexportmethodgen(g_repo, globals())

class PrintUI(ui.ui):
    def __init__(self, *args, **kwargs):
        super(PrintUI, self).__init__(*args, **kwargs)
        self._colinfo=None
        self.fout=self

    # ui.ui for some reason does not support outputting unicode
    def write(self, *args, **kwargs):
        if self._buffers:
            self._buffers[-1].extend([str(a) for a in args])
        else:
            for a in args:
                self._colinfo=echom(a, self._colinfo)

    def write_err(self, *args, **kwargs):
        for a in args:
            self._colinfo=echoe(a, self._colinfo)

    def flush(self):
        pass

class CaptureUI(PrintUI):
    def __init__(self):
        self._captured=[]
        super(CaptureUI, self).__init__()

    def write(self, *args, **kwargs):
        target=self._buffers[-1] if self._buffers else self._captured
        target.extend([str(a) for a in args])

    def _getCaptured(self, verbatim=False):
        if verbatim:
            return "".join(self._captured)
        r=[s.replace("\0", "\n") for s in ("".join(self._captured)).split("\n")]
        self._captured=[]
        return r

class CaptureToBuf(PrintUI):
    def __init__(self, *args, **kwargs):
        self._vimbuffer=vim.current.buffer
        super(CaptureToBuf, self).__init__(*args, **kwargs)

    def write(self, *args, **kwargs):
        target=self._buffers[-1] if self._buffers else self._vimbuffer
        for a in args:
            lines=str(a).split("\n")
            target[-1]+=lines.pop(0)
            for line in lines:
                target.append(line)

def g_cs(repo, rev):
    try:
        return repo[rev]
    except RepoLookupError:
        vim_throw('norev', rev, repo.path)

def g_fctx(cs, filepath):
    try:
        return cs.filectx(filepath)
    except error.LookupError:
        vim_throw('nofile', filepath, cs.hex(), cs._repo.path)

def set_rev_dict(cs, cs_vim):
    cs_vim['hex']           = cs.hex()
    cs_vim['time']          = int(cs.date()[0])
    cs_vim['description']   = cs.description()
    cs_vim['user']          = cs.user()
    cs_vim['parents']       = [parent.hex() for parent in cs.parents()]

    try:
        cs_vim['branch']    = cs.branch()
    except AttributeError:
        cs_vim['branch']    = 'default'

    try:
        cs_vim['tags']      = cs.tags()
    except AttributeError:
        cs_vim['tags']      = []

    try:
        cs_vim['bookmarks'] = cs.bookmarks()
        # FIXME For some reason using cs.phasestr() here results in an exception
    except AttributeError:
        cs_vim['bookmarks'] = []

    return cs_vim

def get_revlist(repo, startrev=0):
    cscount=len(repo)
    r=[set_rev_dict(g_cs(repo, i), {'rev': i,}) for i in range(startrev, cscount+1)]
    return r

@outermethod
def get_updates(repo, oldtip=None):
    tipcs=repo['tip']
    if oldtip is not None:
        try:
            cs=repo[oldtip]
            if tipcs.hex()==cs.hex():
                return
            startrev=cs.rev()
        except error.RepoLookupError:
            startrev=0
    else:
        startrev=0
    r=get_revlist(repo, startrev)
    tags_vim={}
    for (tag, b) in repo.tags().items():
        tags_vim[tag]=repo[b].hex()
    bookmarks_vim={}
    if hasattr(repo, 'listkeys'):
        bookmarks_vim=repo.listkeys('bookmarks')
    vim_extend(var='a:repo', val={'csnum': (len(repo)+1)})
    vim_extend(val={'css': r,
               'startrev': startrev,
                   'tags': tags_vim,
              'bookmarks': bookmarks_vim,})
    if hasattr(tipcs, 'phase'):
        vim_extend(val={'phases': [repo[rev].phasestr() for rev in range(startrev)]})

def get_cs_tag_dict(l):
    r={}
    for hex, tag in l:
        if hex in r:
            r[hex].append(tag)
        else:
            r[hex]=[tag]
    for key in r:
        r[key].sort()
    return r

@outermethod
@autoexportmethod()
def get_tags(repo):
    tags=get_cs_tag_dict([(repo[val].hex(), key) for key, val
                          in repo.tags().items()])
    bookmarks={}
    if hasattr(repo, 'listkeys'):
        bookmarks=get_cs_tag_dict([(val, key) for key, val
                                   in repo.listkeys('bookmarks').items()])
    return {'tags': tags, 'bookmarks': bookmarks}

@outermethod
@autoexportmethod()
def get_phases(repo):
    return {'phasemap': dict((lambda cs: (cs.hex(), cs.phasestr()))(repo[rev])
                              for rev in repo)}

@outermethod
@autoexportmethod(var='cs')
def get_cs(repo, rev):
    cs=g_cs(repo, rev)
    return set_rev_dict(cs, {'rev': cs.rev()})

@outermethod
@autoexportmethod(var='repo')
def new_repo(repo):
    # TODO remove bookmark label type if it is not available
    vim_repo={'has_octopus_merges': 0,
                   'requires_sort': 0,
                      'changesets': {},
                         'mutable': {'cslist': [], 'commands': {}},
                           'local': 1 if repo.local() else 0,
                      'labeltypes': ['tag',  'bookmark'],
                         'updkeys': ['tags', 'bookmarks'],
                    'hasbookmarks': 1,
                       'hasphases': int(hasattr(repo[None], 'phase')),
             }
    if hasattr(repo, '__len__'):
        vim_repo['csnum']=len(repo)+1
    if not hasattr(commands, 'bookmarks'):
        vim_repo['labeltypes'].pop()
        vim_repo['updkeys'].pop()
        vim_repo['hasbookmarks']=0
    return vim_repo

@outermethod
@autoexportmethod(var='r', utf=False, list=True)
def get_file(repo, rev, filepath):
    fctx=g_fctx(g_cs(repo, rev), filepath)
    return [line.replace("\0", "\n") for line in fctx.data().split("\n")]

@outermethod
@autoexportmethod(var='r', utf=False, list=True)
def annotate(repo, rev, filepath):
    ann=g_fctx(g_cs(repo, rev), filepath).annotate(follow=True, linenumber=True)
    return [(line[0][0].path(), str(line[0][0].rev()), line[0][1])
                                                                for line in ann]

def run_in_dir(dir, func, *args, **kwargs):
    workdir=os.path.abspath('.')
    try:
        os.chdir(dir)
    except AttributeError:
        pass
    except OSError:
        pass
    try:
        func(*args, **kwargs)
    finally:
        os.chdir(workdir)

def dodiff(ui, repo, rev1, rev2, files, opts):
    if not hasattr(repo, '__getitem__'):
        vim_throw('diffuns', repo.path)
    args=[ui, repo]+files
    kwargs=opts
    if rev2:
        kwargs['rev']=[rev2]
        if rev1:
            kwargs['rev'].append(rev1)
    else:
        if rev1:
            kwargs['change']=rev1
    run_in_dir(repo.root, commands.diff, *args, **kwargs)

@outermethod
@autoexportmethod(var='r', utf=False, list=True)
def diff(*args, **kwargs):
    ui=CaptureUI()
    dodiff(ui, *args, **kwargs)
    return ui._getCaptured()

@outermethod
def diffToBuffer(*args, **kwargs):
    ui=CaptureToBuf()
    dodiff(ui, *args, **kwargs)
    if len(vim.current.buffer)>1 and vim.current.buffer[-1] == '':
        vim.current.buffer[-1:]=[]
    else:
        vim.command('setlocal binary noendofline')

def get_renames(cs):
    def get_renames_value(rename):
        return rename[0] if rename else 0
    renames_vim={}
    copies_vim={}
    for f in cs:
        fctx=g_fctx(cs, f)
        rename=get_renames_value(fctx.renamed())
        if rename:
            if rename in cs:
                copies_vim[f]=rename
                renames_vim[f]=0
            else:
                copies_vim[f]=0
                renames_vim[f]=rename
        else:
            copies_vim[f]=0
            renames_vim[f]=0
    return {'renames': renames_vim, 'copies': copies_vim}

@outermethod
@autoexportmethod(var='a:cs', utf=False)
def get_cs_prop(repo, rev, prop):
    cs=g_cs(repo, rev)
    if prop=='files' or prop=='removes' or prop=='changes':
        am=[]
        r=[]
        c=cs.files()
        for f in c:
            if f in cs:
                am.append(f)
            else:
                r.append(f)
        return {'files': am, 'removes': r, 'changes': c}
    elif prop=='renames' or prop=='copies':
        return get_renames(cs)
    elif prop=='allfiles':
        r=[f for f in cs]
    elif prop=='children':
        r=[ccs.hex() for ccs in cs.children()]
    elif prop=='phase':
        if hasattr(cs, 'phasestr'):
            r=cs.phasestr()
        else:
            r='unknown'
    else:
        r=cs.__getattribute__(prop)()
    # XXX There is much code relying on the fact that after getcsprop
    #     property with given name is added to changeset dictionary
    return {prop : r}

@outermethod
@autoexportmethod(utf=False)
def get_status(repo, rev1=None, rev2=None, files=None, clean=None, ignored=None):
    if rev1 is None and rev2 is None:
        rev1='.'
    if hasattr(repo, 'status'):
        if not files:
            m=None
        else:
            m=match.match(None, None, files, exact=True)
        status=repo.status(rev1, rev2, match=m, clean=clean, ignored=ignored,
                           unknown=True)
        return {'modified': status[0],
                   'added': status[1],
                 'removed': status[2],
                 'deleted': status[3],
                 'unknown': status[4],
                 'ignored': status[5],
                   'clean': status[6],}
    else:
        vim_throw('statuns', repo.path)

@outermethod
def update(repo, rev='tip', force=False):
    if not hasattr(repo, '__getitem__'):
        vim_throw('upduns', repo.path)
    rev=g_cs(repo, rev).hex()
    args=[repo.ui, repo, rev]
    kwargs={'clean': bool(force)}
    run_in_dir(repo.root, commands.update, *args, **kwargs)

@outermethod
def dirty(repo, filepath):
    if not hasattr(repo, '__getitem__'):
        vim_throw('statuns', repo.path)
    m=match.match(None, None, [filepath], exact=True)
    status=repo.status(match=m, unknown=True)
    if any(status[:-2]):
        vim.command('let r=1')

repo_props={
            'tagslist': lambda repo: repo.tags().keys(),
        'brancheslist': lambda repo: repo.branchmap().keys(),
       'bookmarkslist': lambda repo: repo.listkeys('bookmarks').keys()
                                        if hasattr(repo, 'listkeys') else [],
                 'url': lambda repo: repo.ui.config('paths', 'default-push') or
                                     repo.ui.config('paths', 'default'),
              'branch': lambda repo: repo.dirstate.branch(),
        }

get_repo_prop = outermethod(autoexportmethod()(get_repo_prop_gen(repo_props)))

@outermethod
def call_cmd(repo, attr, bkwargs, *args, **kwargs):
    if bkwargs:
        for kw in bkwargs:
            if kw in kwargs:
                kwargs[kw]=bool(int(kwargs[kw]))
    if 'force' in kwargs:
        kwargs['force']=bool(int(kwargs['force']))
    else:
        kwargs['force']=False
    for key in [key for key in kwargs if key.find('-')!=-1]:
        newkey=key.replace('-', '_')
        kwargs[newkey]=kwargs.pop(key)
    cargs=[repo.ui, repo]
    cargs.extend(args)
    run_in_dir(repo.root, commands.__getattribute__(attr),
               *cargs, **kwargs)

@outermethod
@autoexportmethod(var='r', utf=False, list=True)
def grep(repo, pattern, files, revisions=None, ignore_case=False, wdfiles=True):
    ui=CaptureUI()
    args=[ui, repo, pattern]
    args.extend(files)
    revisions=[":".join(rev) if type(rev) is list else rev
                             for rev in revisions]
    if not revisions:
        revisions=None
    kwargs={'rev': revisions, 'ignore_case': bool(ignore_case),
            'line_number': True, 'print0': True}
    cs=g_cs(repo, '.')
    kwargs['follow']=not [f for f in files if f not in cs]
    run_in_dir(repo.root, commands.grep, *args, **kwargs)
    items=(ui._getCaptured(verbatim=True)).split("\0")
    # XXX grep uses "\0" as a terminator, thus last line ends with "\0"
    items.pop()
    r_vim=[]
    status_cache={}
    def check_not_modified_since(rev, file):
        key=rev+':'+file
        if key in status_cache:
            return status_cache[key]
        r=file in repo.status(node1=rev, clean=True,
                              match=match.match(None, None, [file],
                                                exact=True))[6]
        status_cache[key]=r
        return r
    while items:
        file=items.pop(0)
        rev=items.pop(0)
        lnum=int(items.pop(0))
        text=items.pop(0)
        if wdfiles and check_not_modified_since(rev, file):
            file=os.path.join(repo.root, file)
        else:
            file=(rev, file)
        r_vim.append({'filename': file, 'lnum': int(lnum), 'text': text})
    return r_vim

@outermethod
@autoexportmethod()
def git_hash(repo, rev):
    hggitpath=None
    hggitname=None
    for hggitname in ['hggit', 'git']:
        hggitpath=repo.ui.config('extensions', hggitname)
        if hggitpath is not None:
            break
    if hggitpath is None:
        vim_throw('nohggitc')
    import sys
    sys.path.insert(0, hggitpath)
    try:
        try:
            if hggitname=='hggit':
                from hggit.git_handler import GitHandler
            elif hggitname=='git':
                from git.git_handler   import GitHandler
        except ImportError:
            vim_throw('nohggit')
        git=GitHandler(repo, repo.ui)
        cs=g_cs(repo, rev)
        r=git.map_git_get(cs.hex())
        if r is None:
            vim_throw('nogitrev', cs.hex(), repo.path)
        return {'git_hex': r}
    finally:
        sys.path.pop(0)

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
