au BufRead,BufNewFile *.woim            set filetype=woim

" Using code from openssl.vim by Noah Spurrier <noah@noah.org>
" dot-files (files starting with ".") gets auto en-/decryption
augroup woim_autoencryption
    autocmd!
    autocmd BufReadPre,FileReadPre	.*.woim set viminfo=
    autocmd BufReadPre,FileReadPre     	.*.woim set noswapfile
    autocmd BufReadPre,FileReadPre     	.*.woim set bin
    autocmd BufReadPre,FileReadPre     	.*.woim set cmdheight=2
    autocmd BufReadPre,FileReadPre     	.*.woim	set shell=/bin/sh
    autocmd BufReadPost,FileReadPost    .*.woim %!openssl bf -d -a 2>/dev/null
    autocmd BufReadPost,FileReadPost	.*.woim set nobin
    autocmd BufReadPost,FileReadPost    .*.woim set cmdheight&
    autocmd BufReadPost,FileReadPost	.*.woim set shell&
    autocmd BufReadPost,FileReadPost	.*.woim execute ":doautocmd BufReadPost ".expand("%:r")
    autocmd BufWritePre,FileWritePre	.*.woim set bin
    autocmd BufWritePre,FileWritePre	.*.woim set cmdheight=2
    autocmd BufWritePre,FileWritePre	.*.woim set shell=/bin/sh
    autocmd BufWritePre,FileWritePre    .*.woim %!openssl bf -e -a -salt 2>/dev/null
    autocmd BufWritePost,FileWritePost	.*.woim silent u
    autocmd BufWritePost,FileWritePost	.*.woim set nobin
    autocmd BufWritePost,FileWritePost	.*.woim set cmdheight&
    autocmd BufWritePost,FileWritePost	.*.woim set shell&
augroup END

