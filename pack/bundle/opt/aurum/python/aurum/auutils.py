import vim, sys, json

def emptystatdct():
    return {
            'modified': [],
            'added'   : [],
            'removed' : [],
            'deleted' : [],
            'unknown' : [],
            'ignored' : [],
            'clean'   : [],
            }

def outermethodgen(g_repo, flush, g):
    def outermethod(func):
        """
            Decorator used to make functions omit showing python traceback in 
            case vim_throw was used.
            Also transforms first argument (which is a path) to an repository 
            object
        """
        def f(path, *args, **kwargs):
            try:
                repo=g_repo(path)
                try:
                    return func(repo, *args, **kwargs)
                finally:
                    flush(repo)
            except AurumError:
                pass
            except vim.error:
                pass
        return f
    return outermethod

def autoexportmethodgen(g_repo, g):
    def autoexportmethod(*extargs, **extkwargs):
        def autoexportmethoddec(func):
            g['_'+func.__name__+'_orig']=func
            def f2(path, *args, **kwargs):
                return func(g_repo(path), *args, **kwargs)
            g['_'+func.__name__]=f2
            def f(*args, **kwargs):
                vim_extend(val=func(*args, **kwargs), *extargs, **extkwargs)
            return f
        return autoexportmethoddec
    return autoexportmethod

class AurumError(Exception):
    pass

def vim_throw(*args):
    vim.command('call s:_f.throw('+nonutf_dumps(args)[1:-1]+')')
    raise AurumError()

def nonutf_dumps(obj):
    todump=[('dump', obj)]
    r=''
    while todump:
        t, obj = todump.pop(0)
        if t == 'inject':
            r+=obj
        else:
            tobj=type(obj)
            if tobj is int:
                r+=str(obj)
            elif tobj is float:
                r += "%1.1e" % obj
            elif tobj is list or tobj is tuple:
                r+='['
                todump.insert(0, ('inject', ']'))
                for value in reversed(obj):
                    todump[:0]=[('dump', value), ('inject', ',')]
            elif tobj is dict:
                r+='{'
                todump.insert(0, ('inject', '}'))
                for key, value in obj.items():
                    todump[:0]=[('dump', key),
                                ('inject', ':'),
                                ('dump', value),
                                ('inject', ',')]
            else:
                r+='"'+str(obj).replace('\\', '\\\\').replace('"', '\\"').replace('\n', '\\n')+'"'
    return r

def utf_dumps(obj):
    return json.dumps(obj, encoding='utf8')

if hasattr(vim, 'bindeval'):
    if hasattr(vim, 'Dictionary') and hasattr(vim.Dictionary, 'update'):
        def vim_extend(val, var='d', utf=True, list=False):
            if list:
                vim.bindeval(var).extend(val)
            else:
                vim.bindeval(var).update(val)
    else:
        def vim_extend(val, var='d', utf=True, list=False):
            d_vim = vim.bindeval(var)
            if list:
                d_vim.extend(val)
            else:
                for key in val:
                    d_vim[key] = val[key]
else:
    def vim_extend(val, var='d', utf=True, list=False):
        vim.eval('extend('+var+', '+((utf_dumps if utf else nonutf_dumps)(val))+')')

if hasattr(vim, 'bindeval'):
    ansi_esc_echo_func=None
    def register_ansi_esc_echo_func(func):
        global ansi_esc_echo_func
        ansi_esc_echo_func=func
        global echom
        echom=ansi_esc_echo

    def ansi_esc_echo(o, colinfo):
        if colinfo is None:
            return ansi_esc_echo_func(str(o), self={})
        else:
            return ansi_esc_echo_func(str(o), colinfo, self={})

def pyecho(o, error=False):
    try:
        return (sys.stderr if error else sys.stdout).write(str(o))
    except UnicodeDecodeError:
        if error:
            vim.command('echohl ErrorMsg')
        for line in str(o).split("\n"):
            if not line:
                line=' '
            vim.command('echomsg '+utf_dumps(line))
        if error:
            vim.command('echohl None')

echoe=lambda o, colinfo: pyecho(o, True )
echom=lambda o, colinfo: pyecho(o, False)

def get_repo_prop_gen(repo_props, pathattr='path'):
    def get_repo_prop(repo, prop):
        if prop in repo_props:
            r=repo_props[prop](repo)
            if r is None:
                vim_throw('failcfg', prop, getattr(repo, pathattr))
            else:
                return {prop : r}
        else:
            vim_throw('nocfg', getattr(repo, pathattr), prop)
    return get_repo_prop

def get_one_prop(_get_repo_prop, path, prop):
    return _get_repo_prop(path, prop)[prop]

# vim: ft=python ts=4 sw=4 sts=4 et tw=100
