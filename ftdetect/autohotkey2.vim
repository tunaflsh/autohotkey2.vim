" Vim filetype detect plugin file
" Language:     AutoHotkey v2.0 script file
" Maintainer:   tunaflsh
"		https://github.com/tunaflsh/autohotkey2.vim
" Last Changed: 2025 Feb 19

au BufNewFile *.ahk,*.ahk2 set filetype=autohotkey2
au BufRead *.ahk2 set filetype=autohotkey2
au BufRead *.ahk if matchbufline(
      \	  bufnr(), '\c#Requires AutoHotkey v2\(\.\d\+\)*',
      \	  1, 100
      \ )->len()
      \|  set filetype=autohotkey2
      \|endif

" vim: nowrap sw=2 sts=2 ts=8 noet:
