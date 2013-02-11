let s:seg=expand('<sfile>:t:r')
let g:Powerline#Segments#{s:seg}#segments = Pl#Segment#Init([s:seg,
            \ 1,
            \ Pl#Segment#Create('branch',     '%{Powerline#Functions#aurum#GetBranch("$BRANCH")}'),
            \ Pl#Segment#Create('status',     '%{Powerline#Functions#aurum#GetStatus()}'),
            \ Pl#Segment#Create('repository', '%{Powerline#Functions#aurum#GetRepoPath()}'),
            \ Pl#Segment#Create('options',    '%{Powerline#Functions#aurum#GetOptions()}'),
            \ Pl#Segment#Create('progress',   '%{Powerline#Functions#aurum#GetProgress()}'),
            \])
