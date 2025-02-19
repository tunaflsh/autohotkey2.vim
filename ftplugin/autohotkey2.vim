" Vim filetype plugin file
" Defines <Localleader>ll to start the script
" Language:     AutoHotkey v2
" Maintainer:   tunaflsh
"               https://github.com/tunaflsh/autohotkey2.vim
" Last Changed: 2025 Feb 19

if exists("$MSYSTEM")
    let restart_opt = " //restart "
else
    let restart_opt = " /restart "
endif
map <buffer> <Localleader>ll <Cmd>w<CR><Cmd>call system("AutoHotkey"..restart_opt..bufname())<CR>
