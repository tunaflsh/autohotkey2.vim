-- Neovim filetype plugin file
-- Defines <Localleader>ll to start the script
-- Language:    AutoHotkey
-- Maintainer:  tunaflsh
--              https://github.com/tunaflsh/autohotkey2.vim
-- Last Changed: 2025 Feb 19

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
