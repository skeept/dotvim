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
wk.register({
  [","] = {
    name = " comma mappings ",
    f = {
      name = "fzf mappings",
      f = { "<cmd>FzfLua<cr>", "Fzf" },
      g = { "<cmd>FzfLua grep_project<cr>", "grep project" },
      r = { "<cmd>FzfLua oldfiles<cr>", "recent files" },
      c = { "<cmd>FzfLua commands<cr>", "commands" },
      h = { "<cmd>FzfLua command_history<cr>", "command history" },
    },
    v = {
      name = "search and whatever",
      n = { ":vimgrep // *<Left><Left><Left>", "vimgrep this folder [start typing]" },
      r = { ":vimgrep // **/*<Left><Left><Left><Left><Left><Left>", "vimgrep nested" },
    },
    s = {
      name = "settings tabs and more",
      w = { "<cmd>setlocal wrap! | set wrap?<cr>", "toogle wrap" },
      t = { "<cmd>tab split<cr>", "tab split" },
    },
    e = { "<cmd>Fzf files<cr>", "files" },
    b = { "<cmd>FzfLua buffers<cr>", "buffers" },

  },
})
