from __future__ import with_statement
import bzrlib
from bzrlib.errors       import NotBranchError, NoSuchRevision, InvalidRevisionSpec
from bzrlib.workingtree  import WorkingTree
from bzrlib.revisionspec import RevisionSpec
from bzrlib.delta        import report_changes
from aurum.auutils import vim_throw, outermethodgen, autoexportmethodgen, emptystatdct, \
                          get_repo_prop_gen

def flush(repo):
    pass

def g_repo(path):
    try:
        return WorkingTree.open(path)
    except NotBranchError:
        vim_throw('norepo', path)

def bzrmethod(func):
    def f(*args, **kwargs):
        with(bzrlib.initialize()):
            return func(*args, **kwargs)
    f.__name__ = func.__name__
    globals()[func.__name__+'_unchanged'] = func
    return f

outermethod      = outermethodgen(g_repo, flush, globals())
autoexportmethod = autoexportmethodgen(g_repo, globals())

def g_revid(repo, rev):
    try:
        if isinstance(rev, int) or isinstance(rev, long):
            return repo.branch.get_rev_id(rev)
        else:
            return RevisionSpec.from_string(rev).in_history(repo.branch).rev_id
    except (NoSuchRevision, InvalidRevisionSpec):
        vim_throw('norev', rev, repo.basedir)

def g_cs(repo, rev):
    return repo.branch.repository.get_revision(g_revid(repo, rev))

def sorted_str_keys(d):
    r = [key.encode('utf-8') for key in d.iterkeys()]
    r.sort()
    return r

repo_props={
        'branch':        lambda repo: repo.branch.nick,
        'url':           lambda repo: (   repo.branch.get_push_location()
                                       or repo.branch.get_parent()).encode('utf-8'),
        'bookmarkslist': lambda repo: [],
        'brancheslist':  lambda repo: [],
        'tagslist':      lambda repo: sorted_str_keys(repo.branch.tags.get_tag_dict()),
}

get_repo_prop = outermethod(
                autoexportmethod()(
                bzrmethod(
                get_repo_prop_gen(repo_props, pathattr='basedir'))))

class ReadLock(object):
    def __init__(self, o):
        self.o = o

    def __enter__(self):
        self.o.lock_read()

    def __exit__(self, *args):
        self.o.unlock()

def get_all_files(repo, revid):
    tree = repo.branch.repository.revision_tree(revid)
    with ReadLock(tree):
        return list((item[0].encode('utf-8') for item in tree.list_files()))

@outermethod
@autoexportmethod(var='a:cs', utf=False)
@bzrmethod
def get_cs_prop(repo, rev, prop):
    revid = g_revid(repo, rev)
    if prop in set(('files', 'removes', 'changes', 'renames')):
        cs = repo.branch.repository.get_revision(revid)
        if cs.parent_ids:
            status = get_status_unchanged(repo, rev1=cs.parent_ids[0], rev2=revid, renamed=True)
            return { 'renames': status['renames'],
                       'files': status['added']+status['modified'],
                     'removes': status['removed'],
                     'changes': status['removed']+status['added']+status['modified'],
                   }
        else:
            allfiles = get_all_files(repo, revid)
            return {'renames': {}, 'files': allfiles, 'removes': [], 'changes': allfiles}
    elif prop=='allfiles':
        return {'allfiles': get_all_files(repo, revid)}

class StatusReporter(object):
    __slots__ = ('status', 'renames', 'repo', 'ignored', 'files', 'renamed')

    def __init__(self, repo, ignored, files, renamed):
        self.status  = emptystatdct()
        self.renames = {}
        self.repo    = repo
        self.ignored = ignored
        self.files   = files
        self.renamed = renamed

    def report(self, file_id, paths, track_ch, renamed, modified, exe_ch, kind):
        if paths[1] == '':
            return
        if track_ch == 'unchanged':
            if renamed:
                if self.renamed:
                    self.renames[paths[1].encode('utf-8')] = paths[0].encode('utf-8')
                if paths[0] in self.files:
                    self.status['removed' ].append(paths[0])
                if paths[1] in self.files:
                    self.status['added'   ].append(paths[1])
            elif modified == 'created':
                self.status['added'   ].append(paths[1])
            elif modified in set(('deleted', 'missing')):
                self.status['deleted' ].append(paths[1])
            elif exe_ch or modified in set(('kind changed', 'modified')):
                self.status['modified'].append(paths[1])
            else:
                self.status['clean'   ].append(paths[1])
        elif track_ch == 'removed':
            self.status['removed'].append(paths[0])
        elif track_ch == 'added':
            if modified == 'missing':
                self.status['deleted' ].append(paths[1])
            else:
                self.status['added'   ].append(paths[1])
        elif track_ch == 'unversioned':
            if self.repo.is_ignored(paths[1]):
                if self.ignored:
                    self.status['ignored'].append(paths[1])
            else:
                self.status['unknown'].append(paths[1])

class ContainsEverything(object):
    @staticmethod
    def __contains__(o):
        return True

@outermethod
@autoexportmethod()
@bzrmethod
def get_status(repo, rev1=None, rev2=None, files=None, clean=None, ignored=None, renamed=False):
    if not files:
        files = None

    reverse = False
    if not rev1 and rev2:
        rev1, rev2 = rev2, rev1
        reverse = True

    if rev1 or rev2:
        ignored = False

    old = repo.branch.repository.revision_tree(g_revid(repo, rev1)) if rev1 else repo.basis_tree()
    new = repo.branch.repository.revision_tree(g_revid(repo, rev2)) if rev2 else repo

    reporter = StatusReporter(repo, ignored, set(files) if files else ContainsEverything(), renamed)

    with ReadLock(repo), ReadLock(old), ReadLock(new):
        changes  = new.iter_changes(old, clean, files, require_versioned=False,
                                    want_unversioned=True)
        report_changes(changes, reporter)

    r = reporter.status

    if renamed:
        if reverse:
            r['renames']=dict(((value, key) for key, value in reporter.renames.iteritems()))
        else:
            r['renames']=reporter.renames

    if reverse:
        r['deleted'], r['unknown'] = r['unknown'], r['deleted']
        r['added'],   r['removed'] = r['removed'], r['added']

    return r

cs_vim_defaults = {
        'phase'     : 'unknown',
        'bookmarks' : [],
}

def set_rev_dict(cs, cs_vim, reverse_tag_dict):
    cs_vim['hex']         = cs.revision_id
    cs_vim['time']        = int(cs.timestamp)
    cs_vim['description'] = cs.message.encode('utf-8')

    try:
        cs_vim['user']    = cs.get_apparent_authors()[0]
    except IndexError:
        cs_vim['user']    = ''

    cs_vim['parents']     = cs.parent_ids
    cs_vim['branch']      = cs.properties['branch-nick']
    cs_vim['tags']        = [tag.encode('utf-8') for tag in reverse_tag_dict.get(cs.revision_id,[])]

    cs_vim.update(cs_vim_defaults)
    return cs_vim

def g_revno(repo, revid):
    return repo.branch.revision_id_to_revno(revid)

@outermethod
@autoexportmethod()
@bzrmethod
def get_updates(repo, oldtip=None):
    revno = repo.branch.revno()
    tiprev = g_cs(repo, revno)
    if oldtip is not None:
        try:
            oldtiprev = g_cs(repo, oldtip)
        except Exception:
            return get_updates_unchanged(repo)

        if tiprev.revision_id == oldtiprev.revision_id:
            return {'startrev': g_revno(startrev),
                        'tags': dict(((str(key), value)
                                    for key, value
                                    in repo.branch.tags.get_tag_dict().iteritems())),
                   }
        else:
            startrev = g_revno(oldtiprev)
            known_revisions = set(vim.eval('keys(a:repo.changesets)'))
            css = []
            for revid, merge_depth, revno, end_of_merge \
                    in repo.branch.iter_merge_sorted_revisions(
                            start_revision_id =    tiprev.revision_id,
                            stop_revision_id  = oldtiprev.revision_id):
                css.append(set_rev_dict(repo.branch.repository.get_revision(revid),
                                        {'rev': '.'.join(revno)},
                                        repo.branch.tags.get_reverse_tag_dict()))
    else:
        pass

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
