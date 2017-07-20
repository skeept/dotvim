execute frawor#Setup('0.0', {'@/os': '0.0'})

if s:_r.os.name is# 'nt'
    set shell=cmd.exe
    set shellquote=\"
    set shellxquote=
    set shellcmdflag=/s\ /c
endif

let os=s:_r.os

let sep=os.linesep
let esep=""
while !empty(sep)
    let esep.=printf('\x%02x', char2nr(sep[0]))
    let sep=sep[1:]
endwhile
unlet sep

call WriteFile('OS: '.os.name.' ('.os.fullname.')')
call WriteFile('Path separator: '.os.sep)
call WriteFile('Line separator: '.esep)
unlet esep

let cur0dir=os.path.realpath('.')
call WriteFile('Curdir: '.os.path.realpath('.'))

call os.mkdir('directory')
call os.chdir('directory')
let cur1dir=os.path.realpath('.')
call WriteFile('Curdir: '.cur1dir)

new
call os.chdir('..', 1)
let cur2dir=os.path.realpath('.')
call WriteFile('Curdir: '.cur2dir)

wincmd p
let cur3dir=os.path.realpath('.')
call WriteFile('Curdir: '.cur3dir)

call WriteFile('0=2: '.(cur0dir==cur2dir),
            \  '1=3: '.(cur1dir==cur3dir),)

let a   = 'a'
let ab  = os.path.join(a,  'b')
let abc = os.path.join(ab, 'c')

call WriteFile('Basename of a/b: '.os.path.basename(ab))
call WriteFile('Dirname of a/b: '.os.path.dirname(ab))
call WriteFile('a/b/c components: '.join(os.path.split(abc), ', '))
call WriteFile('a/b/c relative to a: '.os.path.relpath(abc, a))
call WriteFile('a/b/c relative to .: '.os.path.relpath(abc))
call WriteFile('a/b/c relative to d: '.os.path.relpath(abc, 'd'))
call WriteFile('../../test/directory relative to ../../test: '.
            \os.path.relpath(os.path.join('..', '..', 'test', 'directory'),
            \                os.path.join('..', '..', 'test')))
call WriteFile('. relative to .: '.os.path.relpath('.', '.'))

W: mkdir
call os.mkdir(abc)
call WriteFile('a:     '.os.path.isdir(a),
            \  'a/b:   '.os.path.isdir(ab),
            \  'a/b/c: '.os.path.isdir(abc))

W: makedirs
call os.makedirs(abc)
call WriteFile('a:     '.os.path.isdir(a),
            \  'a/b:   '.os.path.isdir(ab),
            \  'a/b/c: '.os.path.isdir(abc))

call WriteFile('a/b/c relative to a: '.os.path.relpath(abc,fnamemodify(a,':p')))
call WriteFile('a/b/c relative to .: '.os.path.relpath(abc))
call WriteFile('a/b/c relative to d: '.os.path.relpath(abc, 'd'))

W: rmdir
call os.rmdir(abc)
call WriteFile('a:     '.os.path.isdir(a),
            \  'a/b:   '.os.path.isdir(ab),
            \  'a/b/c: '.os.path.isdir(abc))

W: removedirs
call os.removedirs(ab)
call WriteFile('a:     '.os.path.isdir(a),
            \  'a/b:   '.os.path.isdir(ab),)

call os.makedirs(abc, 0750)
call WriteFile('a:     '.getfperm(a),
            \  'a/b:   '.getfperm(ab),
            \  'a/b/c: '.getfperm(abc))

W: walk
call writefile([], os.path.join(a,   '1'), 'b')
call writefile([], os.path.join(ab,  '2'), 'b')
call writefile([], os.path.join(abc, '3'), 'b')
call os.unlink(os.path.join(ab, '2'))
call os.makedirs(os.path.join(a, 'b2', 'c2', 'd2'))
call WriteFile(map(os.walk('.'), 'string(v:val)'))

W: path.walk
function s:F.walk(arg, path, files)
    call add(a:arg, [a:path, copy(a:files)])
    call filter(a:files, 'v:val isnot# "c2"')
    call WriteFile('Walkning through '.a:path)
endfunction
let l=[]
call os.path.walk('.', s:F.walk, l)
call WriteFile(map(l, 'string(v:val)'))

call WriteFile('a: '.os.path.isdir(a).' '.os.path.exists(a))
call WriteFile('a/1: '.os.path.isdir(os.path.join(a, '1')).' '.
            \          os.path.exists(os.path.join(a, '1')))

W: removetree
call os.removetree(a)
call WriteFile(map(os.walk('.'), 'string(v:val)'))
call WriteFile('a: '.os.path.isdir(a).' '.os.path.exists(a))
call WriteFile('a/1: '.os.path.isdir(os.path.join(a, '1')).' '.
            \          os.path.exists(os.path.join(a, '1')))

W{ Strange filenames: %
call WriteFile('%: '.os.path.exists('%'))
W: mkdir
call os.mkdir('%')
call WriteFile('%: '.os.path.exists('%'))
W: rmdir
call os.rmdir('%')
call WriteFile('%: '.os.path.exists('%'))
W}

if s:_r.os.name is# 'posix'
    W{ Strange filenames: NL
    let NL="\n"
    let aNL="a\n"
    let NLb="\nb"
    let aNLb="a\nb"
    let NLNL="\n\n"
    let list=[NL, aNL, NLb, aNLb, NLNL]
    call reverse(map(reverse(list), 'os.path.join(reverse(list[(v:key):]))'))
    W: Create directories and file
    call os.makedirs(list[-2])
    call writefile([], list[-1], 'b')
    for dir in list
        call WriteFile(substitute(dir, "\n", 'NL', 'g').':')
        call WriteFile('    exists: '.os.path.exists(dir))
        call WriteFile('    isdir: '.os.path.isdir(dir))
    endfor
    W: Change directories
    let olddir=os.path.realpath('.')
    call os.chdir(list[0])
    call WriteFile('Curdir: '.os.path.realpath('.'))
    call os.chdir(olddir)
    call os.chdir(list[-2])
    call WriteFile('Curdir: '.os.path.realpath('.'))
    call os.chdir(olddir)
    W: Walk
    let l=[]
    call os.path.walk('.', s:F.walk, l)
    call WriteFile(map(l, 'string(v:val)'))
    call WriteFile(map(os.walk('.'), 'string(v:val)'))
    W: Remove tree
    call os.removetree(list[0])
    call WriteFile(map(os.walk('.'), 'string(v:val)'))
    W}
endif

