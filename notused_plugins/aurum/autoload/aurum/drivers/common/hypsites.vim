"▶1
scriptencoding utf-8
execute frawor#Setup('0.2', {'@/resources': '0.0',})
"▶1 s:hypsites
let s:dport='domain.(empty(port)?"":":".port)'
let s:link='shellescape("http://".'.s:dport.'.path)'
" TODO cache
let s:dl=    '(executable("curl")?'.
            \   '(system("curl -L ".'.s:link.')):'.
            \'(executable("wget")?'.
            \   '(system("wget -O- ".'.s:link.'))'.
            \':'.
            \   '(0)))'
unlet s:link
let s:bbdict={
\       'html': '"https://".domain.path."/src/".hex."/".file',      'hline': '"cl-".line',
\        'raw': '"https://".domain.path."/raw/".hex."/".file',
\   'annotate': '"https://".domain.path."/annotate/".hex."/".file', 'aline': '"line-".line',
\   'filehist': '"https://".domain.path."/history/".file',
\     'bundle': '"https://".domain.path."/get/".hex.".tar.bz2"',
\  'changeset': '"https://".domain.path."/changeset/".hex',
\        'log': '"https://".domain.path."/changesets"',
\      'clone': '"https://".domain.path',
\       'push': '"ssh://hg@".domain.path',
\}
let s:hyp={}
let s:gcproj='matchstr(domain, "\\v^[^.]+")'
"▶1 mercurial
"  https://bitbucket.org/ZyX_I/aurum / ssh://hg@bitbucket.org/ZyX_I/aurum
"  ssh://zyxsf@translit3.hg.sourceforge.net/hgroot/translit3/translit3 / http://translit3.hg.sourceforge.net:8000/hgroot/translit3/translit3
"  https://vim-pyinteractive-plugin.googlecode.com/hg/
"  http://hg.assembla.com/CMakeLua
"  https://zyx@zyx.codebasehq.com/test/test.hg / ssh://hg@codebasehq.com/zyx/test/test.hg
"  https://hg01.codeplex.com/visualhg
"  http://mercurial.intuxication.org/hg/tryton-client_ru
"  https://mirrors.kilnhg.com/Repo/Mirrors/Hg/Mercurial
"  http://hg.mozdev.org/maf/ / ssh://USER:PASS@hg.mozdev.org/maf
"u https://projectkenai.com/hg/sonichg~test (rev numbers must match)
"  https://hg.kenai.com/hg/sonichg~test / ssh://user@hg.kenai.com/sonichg~test
"  http://hg.savannah.nongnu.org/hgweb/mechsys/
"  https://sharesource.org/hg/alqua/
"  http://mercurial.tuxfamily.org/mercurialroot/slitaz/tazlito/
"t http://anonscm.debian.org/hg/minicom/
"  https://zyx.repositoryhosting.com/hg/zyx/t3 / ssh://hg@zyx.repositoryhosting.com/zyx/t3
" len("hgroot")=6
let s:pkbase='"http://".matchstr(domain, ''\v[^.]+\.[^.]+$'')."/projects/".matchstr(path, ''\v.*\/\zs[^~]+'').'.
            \                                                '"/sources/". matchstr(path, "\\v[^~]+$")'
let s:cpbase='"http://".path[1:].".codeplex.com/SourceControl'
let s:cbbase='"https://".%s.".".domain."/projects/".%s."/repositories/".%s'
let s:cbssh=printf(s:cbbase, 'matchstr(path, "\\v^[^/]+", 1)',
            \                'matchstr(path, ''\v[^/]+%(\/[^/]+\/?$)'')',
            \                'matchstr(path[:-4], "\\v[^/]+$")')
let s:cbhttps=printf(s:cbbase, 'matchstr(domain, "\\v^[^.]+")',
            \                  'matchstr(path, "\\v^[^/]+")',
            \                  'matchstr(path[:-4], "\\v[^/]+$")')
unlet s:cbbase
let s:hgwebdict={
\       'html': '"http://".'.s:dport.'.path."/file/".hex."/".file',     'hline': '"l".line',
\        'raw': '"http://".'.s:dport.'.path."/raw-file/".hex."/".file',
\   'annotate': '"http://".'.s:dport.'.path."/annotate/".hex."/".file', 'aline': '"l".line',
\   'filehist': '"http://".'.s:dport.'.path."/log/".hex."/".file',
\  'changeset': '"http://".'.s:dport.'.path."/rev/".hex',
\        'log': '"http://".'.s:dport.'.path."/graph"',
\      'clone': '"http://".'.s:dport.'.path',
\}
let s:rhprojs={'hg': ['path[4:]', 'path[1:]', 'ssh', '@@@'],
            \ 'git': map(['path[5:]', 'path[1:]'],
            \           '"substitute(".v:val.", ''\\.git$'', '''', '''')"')+['ssh', '@@@'],
            \ 'svn': ['substitute(path[5:], "_", "/", "")', 'path[1:]', 'svn+ssh', 'tr(@@@, "/", "_")'],}
let s:rhbase='"https://".domain."/trac/".tr(@@@, "/", "_")'
let s:rhdict={
\       'html': s:rhbase.'."/browser/".file."?rev=".hex',                'hline': '"L".line',
\        'raw': s:rhbase.'."/export/".hex."/".file',
\   'annotate': s:rhbase.'."/browser/".file."?annotate=blame&rev=".hex', 'aline': '"L".line',
\   'filehist': s:rhbase.'."/log/".file."?rev=".hex',
\  'changeset': s:rhbase.'."/changeset/".hex',
\        'log': s:rhbase.'."/timeline"',
\      'clone': '"https://".domain."/@u@/".@3@',
\       'push': '"@2@://@u@@".domain."/".@@@',
\}
unlet s:rhbase
let s:rhdicts={}
for [s:vcs, s:rh] in items(s:rhprojs)
    let s:rhdicts[s:vcs]={}
    for i in range(2)
        let s:rhdicts[s:vcs][i]=map(copy(s:rhdict),
                    \'substitute(substitute(substitute('.
                    \'v:val, ''@\(\d\)@'', "\\=s:rh[submatch(1)]", "g"), '.
                    \        '"@@@",       "\\=s:rh['.i.']",       "g"), '.
                    \        '"@u@",       "'.s:vcs.'",            "g")')
    endfor
endfor
unlet s:vcs s:rh s:rhprojs
let s:hyp.mercurial=[
\['domain is? "bitbucket.org"', s:bbdict],
\['domain =~? "\\Vhg.sourceforge.net\\$"',
\ {     'html': '"http://".domain."/hgweb".path[7:]."/file/".hex."/".file',     'hline': '"l".line',
\        'raw': '"http://".domain."/hgweb".path[7:]."/raw-file/".hex."/".file',
\   'annotate': '"http://".domain."/hgweb".path[7:]."/annotate/".hex."/".file', 'aline': '"l".line',
\   'filehist': '"http://".domain."/hgweb".path[7:]."/log/".hex."/".file',
\  'changeset': '"http://".domain."/hgweb".path[7:]."/rev/".hex',
\        'log': '"http://".domain."/hgweb".path[7:]."/graph"',
\      'clone': '"http://".domain.":8000".path',
\       'push': '"ssh://".user."@".domain.path',}],
\['domain =~? "\\Vgooglecode.com\\$" && path[:2] is? "/hg"',
\ {     'html': '"http://code.google.com/p/".'.s:gcproj.'."/source/browse/".file."?r=".hex', 'hline': 'line',
\        'raw': '"http://".domain."/hg-history/".hex."/".file',
\   'filehist': '"http://code.google.com/p/".'.s:gcproj.'."/source/list?path=/".file."&r=".hex',
\  'changeset': '"http://code.google.com/p/".'.s:gcproj.'."/source/detail?r=".hex',
\        'log': '"http://code.google.com/p/".'.s:gcproj.'."/source/list"',
\      'clone': 'url',
\       'push': 'url',}],
\['domain is? "hg.assembla.com"',
\ {     'html': '"http://trac-".domain.path."/browser/".file."?rev=".hex',                'hline': '"L".line',
\   'annotate': '"http://trac-".domain.path."/browser/".file."?annotate=blame&rev=".hex', 'aline': '"L".line',
\   'filehist': '"http://trac-".domain.path."/log/".file."?rev=".hex',
\  'changeset': '"http://trac-".domain.path."/changeset/".hex',
\        'log': '"http://trac-".domain.path."/log"',
\      'clone': '"http://".domain.path',}],
\['domain is? "codebasehq.com" && path[-3:] is? ".hg"',
\ {     'html': s:cbssh.'."/blob/".hex."/".file', 'hline': '"L".line',
\        'raw': s:cbssh.'."/raw/".hex."/".file',
\   'annotate': s:cbssh.'."/blame/".hex."/".file',
\   'filehist': s:cbssh.'."/commits/".hex."/".file',
\     'bundle': s:cbssh.'."/archive/zip/".hex',
\  'changeset': s:cbssh.'."/commit/".hex',
\        'log': s:cbssh.'."/commits/tip"',
\      'clone': '"https://".matchstr(path, "\\v^[^/]+", 1).".".domain.matchstr(path, ''\v[^/]+\/[^/]+$'')',
\       'push': '"ssh://hg@".domain.path',}],
\['domain =~? "\\Vcodebasehq.com\\$" && path[-3:] is? ".hg"',
\ {     'html': s:cbhttps.'."/blob/".hex."/".file', 'hline': '"L".line',
\        'raw': s:cbhttps.'."/raw/".hex."/".file',
\   'annotate': s:cbhttps.'."/blame/".hex."/".file',
\   'filehist': s:cbhttps.'."/commits/".hex."/".file',
\     'bundle': s:cbhttps.'."/archive/zip/".hex',
\  'changeset': s:cbhttps.'."/commit/".hex',
\        'log': s:cbhttps.'."/commits/tip"',
\      'clone': '"https://".domain.path',
\       'push': '"ssh://hg@".matchstr(domain, ''\v\.@<=.*$'')."/".matchstr(domain, "\\v^[^.]+").path',}],
\['domain =~? "\\V\\^hg\\d\\+.codeplex.com\\$"',
\ {     'html': s:cpbase.'"/changeset/view/".hex[:11]."#".substitute(file, "/", "%2f", "g")',
\     'bundle': '"http://download.codeplex.com/Download/SourceControlFileDownload.ashx'.
\                       '?ProjectName=".path[1:]."&changeSetId=".hex[:11]',
\  'changeset': s:cpbase.'"/changeset/changes/".hex[:11]',
\        'log': s:cpbase.'"/list/changesets"',
\      'clone': '"https://".domain.path',
\       'push': '"https://".domain.path',}],
\['domain =~? "\\Vkilnhg.com\\$"',
\ {     'html': '"https://".domain.path."/File/".file."?rev=".hex',               'hline': 'line',
\        'raw': '"https://".domain.path."/FileDownload/".file."?rev=".hex',
\   'annotate': '"https://".domain.path."/File/".file."?rev=".hex&view=annotate', 'aline': 'line',
\   'filehist': '"https://".domain.path."/FileHistory/".file."?rev=".hex',
\  'changeset': '"https://".domain.path."/History/".hex',
\        'log': '"https://".domain.path',
\      'clone': '"https://".domain.path',}],
\['domain =~? ''\V\%(project\)\?kenai.com\$'' && (path[:2] is? "/hg" || domain[:2] is? "hg.")',
\ {     'html': s:pkbase.'."/content/".file."?rev=".repo.functions.getcsprop(repo, hex, "rev")',
\        'raw': s:pkbase.'."/content/".file."?raw=true&rev=".repo.functions.getcsprop(repo, hex, "rev")',
\   'filehist': s:pkbase.'."/history/".file',
\  'changeset': s:pkbase.'."/revision/".repo.functions.getcsprop(repo, hex, "rev")',
\        'log': s:pkbase.'."/history"',
\      'clone': '"https://".domain."/hg/".matchstr(path, "\\v[^/]+$")',
\       'push': '"ssh://".domain."/".matchstr(path, "\\v[^/]+$")',}],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "https" && path[:2] is? "/hg"', s:rhdicts.hg.0],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "ssh" && user is? "hg"',        s:rhdicts.hg.1],
\['domain is? "sharesource.org" && path[:2] is? "/hg"',
\ map(copy(s:hgwebdict), 'substitute(v:val, "http", "https", "")')],
\[ 'domain =~? ''\v^%(mercurial\.%(intuxication|tuxfamily)|hg\.mozdev|hg\.savannah\.%(non)?gnu)\.org$'' || '.
\ '(domain is? "anonscm.debian.org" && path[:2] is? "/hg") || '.
\ '('.s:dl.'=~#''\V<link rel="icon" href="\[^"]\*static/hgicon.png" type="image/png" />'')',
\ s:hgwebdict],
\]
unlet s:hgwebdict s:pkbase s:cpbase s:cbssh s:cbhttps
"▶1 git
"  ssh://git@github.com:MarcWeber/vim-addon-manager / git://github.com/MarcWeber/vim-addon-manager
"  git://gist.github.com/1569146.git / ssh://git@gist.github.com:1569146.git
"  git://vimpluginloader.git.sourceforge.net/gitroot/vimpluginloader/vam-test-repository / ssh://zyxsf@vimpluginloader.git.sourceforge.net/gitroot/vimpluginloader/vam-test-repository
"  git://repo.or.cz/test2.git / http://repo.or.cz/r/test2.git / ssh://repo.or.cz/srv/git/test2.git
"  git://gitorious.org/test4/test.git / https://git.gitorious.org/test4/test.git / ssh://git@gitorious.org:test4/test.git
"  git://git.kitenet.net/mr.git / http://git.kitenet.net/git/mr.git / ssh://git.kitenet.net/srv/git/mr.git
"  (unable to clone with hg-git) https://code.google.com/p/tortoisegit/
"  https://zyx.repositoryhosting.com/git/zyx/t2.git / ssh://git@zyx.repositoryhosting.com/zyx/t2.git
"
" Warning: when using gists you have a choice: either point to a specific file 
"          or to a specific line in whichever file comes first. I have chosen 
"          to use specific file making it impossible to point to a line using 
"          :AuH. This means currently gist has a problem: if there are two 
"          files in gist, then there are two spans having same id.
"          It also seems impossible to download bundle with older version of 
"          gist.
let s:ghpath='substitute(path, "\\v^[:/]|\\.git$", "", "g")'
let s:roproj='matchstr(path, ''\C\v\/@<=[^/]{-1,}%(%(\.git)?\/*$)@='').".git"'
let s:robase='"http://".domain."/w/".'.s:roproj
let s:godomain='substitute(domain, "^git\\.", "", "")'
let s:gobase='"http://".'.s:godomain.'."/".'.s:ghpath
let s:hyp.git=[
\['domain is? "bitbucket.org"', s:bbdict],
\['domain is? "github.com"',
\ {     'html': '"https://".domain."/".'.s:ghpath.'."/blob/".hex."/".file',   'hline': '"L".line',
\                                                                            'hlines': '"L".line1."-L".line2',
\        'raw': '"https://".domain."/".'.s:ghpath.'."/raw/". hex."/".file',
\   'annotate': '"https://".domain."/".'.s:ghpath.'."/blame/". hex."/".file', 'aline': '"LID".line',
\   'filehist': '"https://".domain."/".'.s:ghpath.'."/commits/".hex."/".file',
\     'bundle': '"https://".domain."/".'.s:ghpath.'."/zipball/".hex',
\  'changeset': '"https://".domain."/".'.s:ghpath.'."/commit/".hex',
\        'log': '"https://".domain."/".'.s:ghpath.'."/commits"',
\      'clone': '"git://".domain."/".'.s:ghpath,
\       'push': '"ssh://git@".domain.":".'.s:ghpath.'.".git"',}],
\['domain is? "gist.github.com"',
\ {     'html': '"https://".domain."/".'.s:ghpath.'."/".hex."#file_".tr(file, "-", "_")',
\        'raw': '"https://".domain."/raw/".'.s:ghpath.'."/".hex."/".file',
\     'bundle': '"https://".domain."/gists/".'.s:ghpath.'."/download"',
\  'changeset': '"https://".domain."/".'.s:ghpath.'."/".hex',
\        'log': '"https://".domain."/".'.s:ghpath.'."#revisions"',
\      'clone': '"git://".domain."/".'.s:ghpath.'.".git"',
\       'push': '"ssh://git@".domain.":".'.s:ghpath.'.".git"',
\ }],
\['domain =~? "\\Vgit.sourceforge.net\\$"',
\ {     'html': '"http://".domain."/git/gitweb.cgi?p=".path[9:].";a=blob;hb=".hex.";f=".file', 'hline': '"l".line',
\        'raw': '"http://".domain."/git/gitweb.cgi?p=".path[9:].";a=blob_plain;hb=".hex.";f=".file',
\   'filehist': '"http://".domain."/git/gitweb.cgi?p=".path[9:].";a=history;hb=".hex.";f=".file',
\  'changeset': '"http://".domain."/git/gitweb.cgi?p=".path[9:].";a=commitdiff;hb=".hex',
\        'log': '"http://".domain."/git/gitweb.cgi?p=".path[9:].";a=log"',
\      'clone': '"http://".domain.":8000".path',
\       'push': '"ssh://".user."@".domain.path',}],
\['domain is? "code.google.com"',
\ {     'html': '"http://code.google.com/".substitute(path, "/$", "", "")."/source/browse/".file."?r=".hex',}],
\['domain =~? ''\v^%(git\.)?gitorious\.org$''',
\ {     'html': s:gobase.'."/blobs/".hex."/".file',       'hline': '"line".line',
\        'raw': s:gobase.'."/blobs/raw/".hex."/".file',
\   'annotate': s:gobase.'."/blobs/blame/".hex."/".file', 'aline': '"line".line',
\   'filehist': s:gobase.'."/blobs/history/".hex."/".file',
\  'changeset': s:gobase.'."/commit/".hex',
\        'log': s:gobase.'."/commits/".hex',
\      'clone': '"git://".'.s:godomain.'."/".'.s:ghpath,
\       'push': '"ssh://git@".'.s:godomain.'.":".'.s:ghpath.'.".git"',}],
\['domain is? "repo.or.cz"',
\ {     'html': s:robase.'."/blob/".hex.":/".file',       'hline': '"l".line',
\        'raw': s:robase.'."/blob_plain/".hex.":/".file',
\   'annotate': s:robase.'."/blame/".hex.":/".file',      'aline': '"l".line',
\   'filehist': s:robase.'."/history/".hex.":/".file',
\  'changeset': s:robase.'."/commit/".hex',
\        'log': s:robase.'."/log/".hex',
\      'clone': '"git://".domain."/".'.s:roproj,
\       'push': '"ssh://".domain."/srv/git/".'.s:roproj,}],
\['domain =~? "\\Vgit.kitenet.net\\$"',
\ {     'html': '"http://".domain."/?p=".'.s:roproj.'.";a=blob;hb=".hex.";f=".file', 'hline': '"l".line',
\        'raw': '"http://".domain."/?p=".'.s:roproj.'.";a=blob_plain;hb=".hex.";f=".file',
\   'filehist': '"http://".domain."/?p=".'.s:roproj.'.";a=history;hb=".hex.";f=".file',
\  'changeset': '"http://".domain."/?p=".'.s:roproj.'.";a=commitdiff;hb=".hex',
\        'log': '"http://".domain."/?p=".'.s:roproj.'.";a=log"',
\      'clone': '"git://".domain."/".'.s:roproj,
\       'push': '"ssh://".domain."/srv/git/".'.s:roproj,}],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "https" && path[:3] is? "/git"', s:rhdicts.git.0],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "ssh" && user is? "git"',        s:rhdicts.git.1],
\]
unlet s:ghpath s:roproj s:robase s:godomain s:gobase
"▶1 subversion
"  https://vimpluginloader.svn.sourceforge.net/svnroot/vimpluginloader
"  http://conque.googlecode.com/svn/trunk
"  https://zyx.repositoryhosting.com/svn/zyx_t1 / svn+ssh://svn@zyx.repositoryhosting.com/zyx/t1
"  http://pysvn.tigris.org/svn/pysvn/trunk
let s:svngcbase='"http://code.google.com/p/".'.s:gcproj
let s:svngcfile='path[5:]."/".file'
let s:hyp.svn=[
\['domain =~? "\\Vsvn.sourceforge.net\\$"',
\ {     'html': '"http://".domain."/viewvc".path[8:]."/".file."?view=markup&pathrev=".hex', 'hline': '"l".line',
\        'raw': '"http://".domain."/viewvc".path[8:]."/".file."?pathrev=".hex',             'aline': '"l".line',
\   'annotate': '"http://".domain."/viewvc".path[8:]."/".file."?annotate=".hex',
\     'bundle': '"http://".domain."/viewvc".path[8:]."?view=tar&pathrev=".hex',
\        'log': '"http://".domain."/viewvc".path[8:]."?view=log"',
\      'clone': 'url',}],
\['domain =~? "\\Vgooglecode.com\\$" && path[:3] is? "/svn"',
\ {     'html': s:svngcbase.'."/source/browse/".'.s:svngcfile.'."?rev=".hex', 'hline': 'line',
\        'raw': '"http://".domain."/svn-history/r".hex.'.s:svngcfile,
\   'filehist': s:svngcbase.'."/source/list?path=/".'.s:svngcfile.'."&r=".hex',
\        'log': s:svngcbase.'."/source/list"',
\      'clone': 'url',}],
\['domain is? "svn.gna.org"',
\ {     'html': '"http://".domain."/viewvcs".path[4:]."/".file."?view=markup&revision=".hex',   'hline': '"l".line',
\        'raw': '"http://".domain."/viewvcs/*checkout*".path[4:]."/".file."?view=markup&revision=".hex',
\   'annotate': '"http://".domain."/viewvcs".path[4:]."/".file."?annotate=".hex',               'aline': '"l".line',
\   'filehist': '"http://".domain."/viewvcs".path[4:]."/".file."?view=log"',
\        'log': '"http://".domain."/viewvcs".path[4:]."?view=log"',
\      'clone': '"svn://".domain.path',
\       'push': '"svn+ssh://".user."@".domain.path',}],
\['domain =~? "\\Vtigris.org\\$"',
\ {     'html': '"http://".domain."/source/browse".path[4:]."/".file."?view=markup&revision=".hex',
\        'raw': '"http://".domain."/source/browse/*checkout*".path[4:]."/".file."?revision=".hex',
\   'annotate': '"http://".domain."/source/browse".path[4:]."/".file."?annotate=".hex', 'aline': '"id".(line-1)',
\   'filehist': '"http://".domain."/source/browse".path[4:]."/".file."?view=log"',
\      'clone': '"http://".domain.path',
\       'push': 'url',}],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "https" && path[:3] is? "/svn"', s:rhdicts.svn.0],
\['domain =~? "\\Vrepositoryhosting.com\\$" && protocol is? "svn+ssh"',                      s:rhdicts.svn.1],
\]
unlet s:svngcbase s:svngcfile
unlet s:rhdicts
"▶1 bazaar
let s:hyp.bzr=[
\]
"▶1 post resource
unlet s:gcproj s:dl s:bbdict s:dport
call s:_f.postresource('hypsites', s:hyp)
unlet s:hyp
"▶1
call frawor#Lockvar(s:, '_pluginloaded')
" vim: ft=vim ts=4 sts=4 et fmr=▶,▲ tw=0
