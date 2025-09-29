-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

vim.keymap.set({ "n", "v" }, "<F1>", ":wa<CR>", { noremap = true })
vim.keymap.set("i", "<F1>", "<C-O>:wa<CR>", { noremap = true })

vim.keymap.set("n", "g/", "/\\<\\><left><left>", { noremap = true })
vim.keymap.set("n", "<tab>", "<c-w>", { noremap = true })

vim.keymap.set({ "n", "v" }, "<F4>", ":x<CR>", { noremap = true })
vim.keymap.set("i", "<F4>", "<C-O>:x<CR>", { noremap = true })

vim.api.nvim_create_user_command("DeltTrailingSpace", function()
  vim.cmd([[%s/\s\+$//e]])
end, {
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

vim.api.nvim_create_user_command("CaptureToScratch", function(args)
  CaptureOutput(true, args.args)
end, {
  desc = "capture output to scratch buffer",
  nargs = "+",
})

vim.keymap.set("n", "<Leader>oo", ":CaptureToScratch<space>")
vim.keymap.set("n", "<Leader>oc", ":CaptureOutput<space>")

vim.api.nvim_create_user_command("Pcp", function()
  vim.cmd("echo expand('%:p')")
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {
  desc = "Print current path and copy to clipboard",
})

local wk = require("which-key")
wk.add({
  { ",", group = "comma mappings" },
  {
    ",e",
    function()
      local count = vim.v.count
      local modifier = ":p:h" .. string.rep(":h", count)
      require("fzf-lua").files({ cwd = vim.fn.expand("%" .. modifier) })
    end,
    desc = "files in pwd",
  },
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

-- Keymap for the epoch time converter
vim.keymap.set("n", "\\e", function()
  require("wk.epoch").convert_time_with_count()
end, { desc = "Convert epoch time [count: 2=write, 3=toggle]" })

require("wk.block_nav").setup()

vim.keymap.set("n", ",cd", function()
  local count = vim.v.count
  vim.cmd("ChgDirCurrFileFolder " .. count)
end, { desc = "Change to current file's directory (local)" })

vim.keymap.set("n", ",cD", function()
  local count = vim.v.count
  vim.cmd("ChgDirCurrFileFolder! " .. count)
end, { desc = "Change to current file's directory (global)" })
