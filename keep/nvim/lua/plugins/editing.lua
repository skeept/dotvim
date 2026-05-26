return {
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
  { "chrisbra/NrrwRgn", cmd = { "NR", "NW", "NRV", "NRPrepare", "NRMulti" } },
  {
    "shougo/junkfile.vim",
    cmd = { "JunkfileOpen", "JunkFileBrowse" },
    keys = {
      { "<leader>j", group = "Junkfile", desc = "+Junkfile" },
      { "<leader>jf", "<cmd>JunkfileOpen<CR>", mode = { "n", "v" }, desc = "Open junkfile" },
      { "<leader>jb", "<cmd>JunkFileBrowse<CR>", mode = { "n", "v" }, desc = "Browse junkfiles" },
    },
    dependencies = { "ibhagwan/fzf-lua" },
    config = function()
      local junkdir = vim.fn.expand("~/.cache/junkfile")
      if vim.fn.isdirectory(junkdir) == 0 then
        vim.fn.mkdir(junkdir, "p")
      end

      vim.api.nvim_create_user_command("JunkfileOpen", function(opts)
        local timestamp = os.date("%Y-%m-%d-%H%M%S.")
        vim.fn["junkfile#open"](timestamp, opts.args)
      end, {
        range = true,
        nargs = "?",
        desc = "Open a new junkfile with a timestamp",
      })

      vim.api.nvim_create_user_command("JunkFileBrowse", function()
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
