-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

vim.keymap.set("n", "<F1>", "wa")
vim.keymap.set("i", "<F1>", "<C-O>:wa<CR>")

vim.keymap.set("n", "g/", "/\\<\\><left><left>")
vim.keymap.set("n", "<tab>", "<c-w>")

local function DeltTrailingSpace()
  vim.cmd([[
normal mz
normal Hmy
]])
end

vim.api.nvim_create_user_command("DeltTrailingSpace", DeltTrailingSpace, {
  desc = "delete trailing whitespace",
})

local function CaptureOutput(use_scractch, cmd_)
  local more_opt = vim.go.more
  vim.cmd("redir => captured")
  vim.cmd("silent " .. cmd_)
  vim.cmd("redir END")
  if use_scractch then
    vim.cmd("Sscratch")
  end
  vim.cmd("normal G")
  vim.cmd("put=captured")
  vim.o.more = more_opt
end

vim.api.nvim_create_user_command("CaptureOutput", function(args)
  CaptureOutput(false, args.args)
end, {
  desc = "capture output",
  nargs = "+",
})

vim.api.nvim_create_user_command("CaptureToSractch", function(args)
  CaptureOutput(true, args.args)
end, {
  desc = "capture output to scratch buffer",
  nargs = "+",
})

vim.keymap.set("n", "<Leader>oo", ":CaptureToSractch<space>")
vim.keymap.set("n", "<Leader>oc", ":CaptureOutput<space>")

vim.api.nvim_create_user_command("Pcp", function()
  vim.cmd("echo expand('%:p')")
end, {
  desc = "Print current Path",
})

local wk = require("which-key")
wk.add({
  { ",", group = "comma mappings" },
  { ",e", "<cmd>Fzf files<cr>", desc = "files" },
  { ",b", "<cmd>FzfLua buffers<cr>", desc = "buffers" },
  { ",f", group = "fzf" },
  { ",ff", "<cmd>FzfLua<cr>", desc = "Fzf" },
  { ",fg", "<cmd>FzfLua grep_project<cr>", desc = "grep project" },
  { ",fr", "<cmd>FzfLua oldfiles<cr>", desc = "recent files" },
  { ",fc", "<cmd>FzfLua commands<cr>", desc = "commands" },
  { ",fh", "<cmd>FzfLua command_history<cr>", desc = "command history" },
  { ",v", group = "search with vimgrep" },
  { ",vn", ":vimgrep // *<Left><Left><Left>", desc = "vimgrep this folder (start typing)" },
  { ",vr", ":vimgrep // **/*<Left><Left><Left><Left><Left><Left>", desc = "vimgrep nested" },
  { ",s", group = "settings, tabs and more" },
  { ",sw", "<cmd>setlocal wrap! | set wrap?<cr>", desc = "toogle wrap" },
  { ",st", "<cmd>tab split<cr>", desc = "tab split" },
})
