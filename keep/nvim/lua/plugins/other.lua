-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  -- {
  --   "L3MON4D3/LuaSnip",
  --   keys = function()
  --     return {}
  --   end,
  -- },
  -- then: setup supertab in cmp
  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     -- calling `setup` is optional for customization
  --     -- require("fzf-lua").setup({ "fzf-native" })
  --     require("fzf-lua").setup({ "max-perf" })
  --   end,
  -- },
  -- {
  --   "akinsho/bufferline.nvim",
  --   opts = {
  --     options = {
  --       mode = "tabs",
  --     },
  --   },
  -- },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/notes/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
    -- conditional loading based on OS
    enabled = vim.loop.os_uname().sysname == "Linux",
  },
  {
    "cappyzawa/trim.nvim",
    opts = {},
  },
  {
    "https://git.sr.ht/~swaits/scratch.nvim",
    lazy = true,
    keys = {
      { "<leader>bs", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
      { "<leader>bS", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
    },
    cmd = {
      "Scratch",
      "ScratchSplit",
    },
    opts = {},
  },
  {
    "chrisbra/NrrwRgn",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "shougo/junkfile.vim",
    cmd = { "JunkfileOpen", "JunkFileBrowse" },
    keys = {
      { "<leader>j", group = "Junkfile", desc = "+Junkfile" },
      { "<leader>jf", "<cmd>JunkfileOpen<CR>", mode = { "n", "v" }, desc = "Open junkfile" },
      { "<leader>jb", "<cmd>JunkFileBrowse<CR>", mode = { "n", "v" }, desc = "Browse junkfiles" },
    },
    -- Explicitly declare the dependency on fzf-lua
    dependencies = { "ibhagwan/fzf-lua" },
    config = function()
      -- 1. Use the standard path for the cache directory
      local junkdir = vim.fn.expand("~/.cache/junkfile")
      if vim.fn.isdirectory(junkdir) == 0 then
        vim.fn.mkdir(junkdir, "p")
      end

      -- 2. Define JunkfileOpen using the modern Lua API for consistency
      vim.api.nvim_create_user_command("JunkfileOpen", function(opts)
        local timestamp = os.date("%Y-%m-%d-%H%M%S.")
        vim.fn["junkfile#open"](timestamp, opts.args)
      end, {
        range = true,
        nargs = "?",
        desc = "Open a new junkfile with a timestamp",
      })

      -- 3. Define the fzf-lua-based JunkFileBrowse command
      vim.api.nvim_create_user_command("JunkFileBrowse", function()
        -- The dependency ensures 'fzf-lua' is available here
        require("fzf-lua").files({
          prompt = "Junkfiles> ",
          cwd = junkdir,
        })
      end, {
        desc = "Browse junkfiles with fzf-lua",
      })
    end,
  },
}
