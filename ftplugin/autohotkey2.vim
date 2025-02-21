" Vim filetype plugin file
" Language:     AutoHotkey v2.0 script file
" Maintainer:   tunaflsh
"               https://github.com/tunaflsh/autohotkey2.vim
" Last Changed: 2025 Feb 19
" Copied From:  https://github.com/vim/vim/blob/master/runtime/ftplugin/autohotkey.vim

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal comments=:;
setlocal commentstring=;\ %s

let b:undo_ftplugin = "setlocal comments< commentstring<"


if exists("$MSYSTEM")
    let restart_opt = " //restart "
else
    let restart_opt = " /restart "
endif
" (Re)start the script in the current buffer
map <buffer> <Localleader>ll <Cmd>w<CR><Cmd>call system("AutoHotkey"..restart_opt..bufname())<CR>

" Open documentation for the word under cursor
map <buffer> K <Cmd>exe "Open https://www.autohotkey.com/docs/v2/lib/"..expand("<cword>")..".htm"<CR>
