-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

vim.keymap.set("n", "<F1>", "wa")
-- vim.keymap.set("i", "<F1>", )

vim.keymap.set("n", "g/", "/\\<\\><left><left>")

vim.keymap.set("n", "<tab>", "<c-w>")
