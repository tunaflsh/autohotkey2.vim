" Vim filetype plugin file
" Defines <Localleader>ll to start the script
" Language:     AutoHotkey v2.0 script file
" Maintainer:   tunaflsh
"               https://github.com/tunaflsh/autohotkey2.vim
" Last Changed: 2025 Feb 19

if exists("$MSYSTEM")
    let restart_opt = " //restart "
else
    let restart_opt = " /restart "
endif
" (Re)start the script in the current buffer
map <buffer> <Localleader>ll <Cmd>w<CR><Cmd>call system("AutoHotkey"..restart_opt..bufname())<CR>

" Open documentation for the word under cursor
map <buffer> K <Cmd>Open "https://www.autohotkey.com/docs/v2/lib/"..expand("<cword>")..".htm"<CR>
