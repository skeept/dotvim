-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "lfrc",
  desc = "Set filetype for lfrc to shell script",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

-- Disable spell checking for specific data files and anything inside a debug directory
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.dat", "*/debug/*", "debug/*" },
  desc = "Disable spell checking for data and debug files",
  callback = function()
    vim.opt_local.spell = false
  end,
})
