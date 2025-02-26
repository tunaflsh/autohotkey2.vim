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

if has("nvim")
lua << EOF
-- (Re)start the script in the current buffer
vim.keymap.set("", "<Localleader>ll",
    function()
        vim.cmd.write()
        vim.system({ "AutoHotkey", "/restart", vim.api.nvim_buf_get_name(0) })
    end,
    {
        buffer = true,
        desc = "(Re)start the script (AutoHotkey v2)",
    }
)
-- Open documentation for the word under cursor
vim.keymap.set("", "K",
  function()
      vim.ui.open("https://www.autohotkey.com/docs/v2/lib/"
        ..vim.fn.expand("<cword>")..".htm")
  end,
  {
      buffer = true,
      desc = "Open documentation for the <cword> (AutoHotkey v2)",
  }
)
EOF
else
    if exists("$MSYSTEM")
        let restart_opt = " //restart "
    else
        let restart_opt = " /restart "
    endif
    " (Re)start the script in the current buffer
    map <buffer> <Localleader>ll
                \ <Cmd>w<CR>
                \<Cmd>call system("AutoHotkey"..restart_opt..bufname())<CR>

    " Open documentation for the word under cursor
    map <buffer> K
                \ <Cmd>exe
                \ "Open https://www.autohotkey.com/docs/v2/lib/"
                \ .. expand("<cword>") .. ".htm"<CR>
endif
