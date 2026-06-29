-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })

vim.keymap.set({ "n", "v" }, "<F1>", ":wa<CR>", { noremap = true })
vim.keymap.set("i", "<F1>", "<C-O>:wa<CR>", { noremap = true })

vim.keymap.set("n", "g/", "/\\<\\><left><left>", { noremap = true })
vim.keymap.set("n", "<tab>", "<c-w>", { noremap = true })

-- gp: select last pasted (or changed) text
vim.keymap.set("n", "gp", "`[v`]", { noremap = true, desc = "Select last pasted text" })
-- gy: yank line without newline, restoring cursor
vim.keymap.set("n", "gy", "m`^yg_``", { noremap = true, desc = "Yank inner line (no newline)" })
-- gY: yank from cursor to end of line (no newline)
vim.keymap.set("n", "gY", "yg_", { noremap = true, desc = "Yank to end of line" })

-- vim.keymap.set({ "n", "v" }, "<F4>", ":x<CR>", { noremap = true })
-- vim.keymap.set("i", "<F4>", "<C-O>:x<CR>", { noremap = true })

vim.api.nvim_create_user_command("DelTrailingSpace", function()
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
    ",fi",
    function()
      local count = vim.v.count
      local modifier = ":p:h" .. string.rep(":h", count)
      require("fzf-lua").files({ cwd = vim.fn.expand("%" .. modifier) })
    end,
    desc = "files in dir (count=go up)",
  },
  {
    ",e",
    function()
      local count = vim.v.count
      local modifier = ":p:h" .. string.rep(":h", count)
      require("fzf-lua").files({
        cwd = vim.fn.expand("%" .. modifier),
        fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git",
      })
    end,
    desc = "fzf: all files incl. ignored in dir (count=go up)",
  },
  {
    ",fd",
    function()
      local count = vim.v.count
      local modifier = ":p:h" .. string.rep(":h", count)
      require("fzf-lua").live_grep({ cwd = vim.fn.expand("%" .. modifier) })
    end,
    desc = "fzf: grep in dir (count=go up)",
  },
  { ",b", "<cmd>FzfLua buffers<cr>", desc = "buffers" },
  { ",f", group = "find" },
  -- fff (fast fuzzy finder) — lowercase
  {
    ",ff",
    function()
      require("fff").find_files()
    end,
    desc = "fff: files",
  },
  {
    ",fp",
    function()
      local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
      require("fff").find_files({ cwd = root })
    end,
    desc = "fff: files from project root",
  },
  {
    ",fg",
    function()
      require("fff").live_grep()
    end,
    desc = "fff: grep",
  },
  {
    ",fG", -- override: fff project root grep (fzf grep_project moved to ,fG below)
    function()
      local root = vim.fs.root(0, ".git") or vim.fn.getcwd()
      require("fff").live_grep({ cwd = root })
    end,
    desc = "fff: grep from project root",
  },
  {
    ",fz",
    function()
      require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
    end,
    desc = "fff: fuzzy grep",
  },
  {
    ",fw",
    function()
      require("fff").live_grep({ query = vim.fn.expand("<cword>") })
    end,
    desc = "fff: grep word under cursor",
  },
  -- fzf-lua — uppercase for overlapping operations
  { ",fF", "<cmd>FzfLua files<cr>", desc = "fzf: files" },
  {
    ",fP",
    function()
      require("fzf-lua").grep_project()
    end,
    desc = "fzf: grep project",
  },
  { ",fr", "<cmd>FzfLua oldfiles<cr>", desc = "fzf: recent files" },
  { ",fc", "<cmd>FzfLua commands<cr>", desc = "fzf: commands" },
  { ",fh", "<cmd>FzfLua command_history<cr>", desc = "fzf: command history" },
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

vim.keymap.set({ "n", "v", "o" }, "<F4>", function()
  require("wk.utils").close_tab_or_exit(vim.v.count)
end, { silent = true, desc = "Close tab or exit" })

vim.keymap.set("i", "<F4>", function()
  vim.cmd("stopinsert")
  require("wk.utils").close_tab_or_exit(vim.v.count)
end, { silent = true, desc = "Close tab or exit from insert mode" })

-- ==========================================================================
-- Overriding LazyVim Defaults (Swap Root vs Current Folder Searching)
-- ==========================================================================

-- 1. Swap Files Search: <leader>ff (cwd) vs <leader>fF (root)
vim.keymap.set(
  "n",
  "<leader>ff",
  LazyVim.pick("files", { root = false }),
  { desc = "Find Files (cwd)" }
)
vim.keymap.set("n", "<leader>fF", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })

-- 2. Swap Live Grep: <leader>sg (cwd) vs <leader>sG (root)
vim.keymap.set(
  "n",
  "<leader>sg",
  LazyVim.pick("live_grep", { root = false }),
  { desc = "Grep (cwd)" }
)
vim.keymap.set("n", "<leader>sG", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })

-- 3. Change Global Grep (<leader>/) to search from current folder instead of root
vim.keymap.set(
  "n",
  "<leader>/",
  LazyVim.pick("live_grep", { root = false }),
  { desc = "Grep (cwd)" }
)
