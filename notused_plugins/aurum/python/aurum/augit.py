import pygit2 as git
from aurum.auutils import vim_throw, outermethodgen, autoexportmethodgen, emptystatdct, \
                          get_repo_prop_gen

def flush(repo):
    pass

# TODO Maybe cache repo and cs? It seems that unlike with mercurial it is supported in pygit2

def g_repo(path):
    try:
        return git.Repository(path)
    except KeyError:
        vim_throw('norepo', path)

outermethod      = outermethodgen(g_repo, flush)
autoexportmethod = autoexportmethodgen(g_repo, globals())

def g_cs(repo, rev):
    if hasattr(repo, 'revparse_single'):
        try:
            # TODO Check this. Currently it works only in development branch
            r = repo.revparse_single(rev)
        except Exception: # FIXME be more specific
            vim_throw('norev', rev, repo.path)
    else:
        try:
            ref = repo.lookup_reference(rev)
            r = repo[ref.resolve().oid]
        except KeyError:
            try:
                r = repo[unicode(rev, 'utf-8')]
            except KeyError:
                vim_throw('norev', rev, repo.path)

    while not isinstance(r, git.Commit):
        if isinstance(r, git.Tag):
            r = repo[r.target]
        else:
            vim_throw('uresrev', repr(r), rev, repo.path)

    return r

def all_refs(repo):
    return ((rname, g_cs(repo, rname).hex)
            for rname in ('HEAD',)+repo.listall_references())

def get_branch(repo):
    try:
        ref = repo.lookup_reference('HEAD')
    except KeyError:
        vim_throw('nohead', path)

    try:
        target = ref.target
    except ValueError:
        return ''

    if target.startswith('refs/heads/'):
        return target[11:]
    else:
        return ''

def get_url(repo):
    cfg = repo.config
    try:
        return cfg['remote.origin.pushurl']
    except KeyError:
        try:
            return cfg['remote.origin.url']
        except KeyError:
            return None

repo_props={
    'branch':        get_branch,
    'url':           get_url,
    'bookmarkslist': lambda repo: (),
    'brancheslist':  lambda repo: [s[11:] for s in repo.listall_references()
                                   if s.startswith('refs/heads/')],
    'tagslist':      lambda repo: [s[10:] for s in repo.listall_references()
                                   if s.startswith('refs/tags/')],
}
repo_props['branchslist'] = repo_props['brancheslist']

get_repo_prop = outermethod(autoexportmethod()(get_repo_prop_gen(repo_props)))

def list_tree_files(tree, prefix=None):
    for tentry in tree:
        fname = prefix+'/'+tentry.name if prefix else tentry.name
        ntree = tentry.to_object()
        if isinstance(ntree, git.Tree):
            for nfname in list_tree_files(ntree, prefix=fname):
                yield nfname
        else:
            yield fname

@outermethod
@autoexportmethod()
def get_status(repo, files=None, clean=None, ignored=None):
    r = emptystatdct()
    if files:
        statuses = ((fname, repo.status_file(fname)) for fname in files)
    else:
        status = repo.status()
        statuses = status.iteritems()
        if clean:
            r['clean'] = [fname for fname in list_tree_files(g_cs(repo, 'HEAD').tree)
                          if fname not in status]
    while True:
        try:
            fname, status = statuses.next()
        except StopIteration:
            break
        except KeyError:
            # File is not known
            continue
        except ValueError:
            # File is a directory
            continue
        if status == git.GIT_STATUS_CURRENT:
            r['clean'].append(fname)
        elif status & git.GIT_STATUS_INDEX_DELETED:
            r['removed'].append(fname)
        elif status & git.GIT_STATUS_WT_DELETED:
            r['deleted'].append(fname)
        elif status & git.GIT_STATUS_INDEX_NEW:
            r['added'].append(fname)
        elif status & git.GIT_STATUS_WT_NEW:
            r['unknown'].append(fname)
        elif status & (git.GIT_STATUS_INDEX_MODIFIED | git.GIT_STATUS_WT_MODIFIED):
            r['modified'].append(fname)
        elif status & git.GIT_STATUS_IGNORED:
            r['ignored'].append(fname)
    for v in r.itervalues():
        v.sort()
    return r

cs_vim_defaults = {
        'phase'     : 'unknown',
        'branch'    : 'default',
        'bookmarks' : [],
}

def set_rev_dict(cs, cs_vim):
    cs_vim['hex']         = str(cs.hex)
    cs_vim['time']        = cs.commit_time
    cs_vim['description'] = cs.message.encode('utf-8')
    cs_vim['user']        = (cs.author.name+u' <'+cs.author.email+u'>').encode('utf-8')
    cs_vim['parents']     = [str(parent.hex) for parent in cs.parents]
    cs_vim.update(cs_vim_defaults)
    # TODO 'rev', 'tags'
    return cs_vim

def get_revlist(repo, startrev):
    return (set_rev_dict(cs, {}) for cs in repo.walk(g_cs(repo, startrev).oid, 0))

# TODO Diff only specific files, diff options (libgit2 supports them, pygit2 will thus eventually do 
#      the same)
def get_diff(repo, rev1, rev2):
    return g_cs(repo, rev1).tree.diff(g_cs(repo, rev2).tree)

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
