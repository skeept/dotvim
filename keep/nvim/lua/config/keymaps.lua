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

vim.api.nvim_create_user_command("Pcp", function(opts)
  local content_to_copy = ""
  if opts.args == "" then
    content_to_copy = vim.fn.expand("%:p")
  else
    content_to_copy = vim.fn.expand("%:t")
  end

  print(content_to_copy)

  if vim.fn.has("clipboard") == 1 then
    vim.fn.setreg("+", content_to_copy)
  end
  vim.fn.setreg("p", content_to_copy)

  if os.getenv("TMUX") then
    vim.fn.system({ "tmux", "set-buffer", content_to_copy })
  end
end, {
  nargs = "?",
  desc = "Copy path (no args) or name (any arg) to clipboard, 'p', and tmux",
})

local function remove_cr()
  local saved_view = vim.fn.winsaveview()
  vim.cmd([[silent! %s/\r//g]])
  vim.fn.winrestview(saved_view)
end

vim.api.nvim_create_user_command(
  "RemoveCR",
  remove_cr,
  { desc = "Remove stray carriage returns (^M)" }
)
vim.api.nvim_create_user_command(
  "TrimCR",
  remove_cr,
  { desc = "Alias of :RemoveCR (remove stray carriage returns (^M))" }
)

vim.keymap.set("n", ",rc", remove_cr, { desc = "Remove stray carriage returns (^M)" })
vim.keymap.set("n", ",tc", remove_cr, { desc = "Trim stray carriage returns (^M)" })

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
