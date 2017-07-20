" Vim filetype plugin file
" Language:		Mail
" Maintainer:	Lubomir Host <host8@kepler.fmph.uniba.sk>
" License:		GNU GPL
" Version:		$Id: mail.vim 738 2003-09-04 21:21:05Z srinathava $


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Don't use modelines in e-mail messages, avoid trojan horses
setlocal nomodeline

" many people recommend keeping e-mail messages 72 chars wide
setlocal textwidth=72

" Set 'formatoptions' to break text lines and keep the comment leader ">".
setlocal formatoptions=crqt12n

setlocal autoindent
setlocal et

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
  " Quote text by inserting "> "
  if !hasmapto('<Plug>MailQuote')
    vmap <buffer> <LocalLeader>q <Plug>MailQuote
    nmap <buffer> <LocalLeader>q <Plug>MailQuote
  endif
  vnoremap <buffer> <Plug>MailQuote :s/^/> /<CR>:noh<CR>``
  nnoremap <buffer> <Plug>MailQuote :.,$s/^/> /<CR>:noh<CR>``

  " Ctrl-F reformat paragraph
  inoremap <buffer> <Plug>MailFormat <Esc>gqapi
  noremap  <buffer> <Plug>MailFormat gqap
  vnoremap <buffer> <Plug>MailFormat gq
endif

" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdc=3 vb t_vb=:
" }}}
