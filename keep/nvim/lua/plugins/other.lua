-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      -- require("fzf-lua").setup({ "fzf-native" })
      require("fzf-lua").setup({ "max-perf" })
    end,
  },
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
}
