-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.fixendofline = true
vim.opt.textwidth = 100

local current_cwd = vim.fn.getcwd():lower():gsub("\\", "/")
local home_path = vim.fn.expand("~"):lower():gsub("\\", "/")

if current_cwd == home_path or current_cwd:find("onedrive") then
  vim.g.root_spec = { "lsp", { ".git", "lua" } } -- Safely slices out the broad 'cwd' scanning fallback
end
