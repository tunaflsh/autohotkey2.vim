-- Neovim filetype plugin file
-- Language:      AutoHotkey v2.0 script file
-- Maintainer:    tunaflsh
--                https://github.com/tunaflsh/autohotkey2.vim
-- Last Changed:  2025 Feb 19

if vim.b.did_ftplugin then
  return
end
vim.b.did_ftplugin = 1

vim.bo.comments = ":;"
vim.bo.commentstring = ";\\ %s"

vim.b.undo_ftplugin = "setlocal comments< commentstring<"

vim.keymap.set("",
  "<Localleader>ll",
  function()
    vim.cmd.write()
    vim.system({ "AutoHotkey", "/restart", vim.api.nvim_buf_get_name(0) })
  end,
  {
    buffer = true,
    desc = "(Re)start the script (AutoHotkey v2)",
  }
)
vim.keymap.set("",
  "K",
  function()
    vim.ui.open("https://www.autohotkey.com/docs/v2/lib/"..vim.fn.expand("<cword>")..".htm")
  end,
  {
    buffer = true,
    desc = "Open documentation for the <cword> (AutoHotkey v2)",
  }
)
