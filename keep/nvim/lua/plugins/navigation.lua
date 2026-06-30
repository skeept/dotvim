return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({ "max-perf" })
    end,
    -- Add the keys block right here inside the fzf-lua spec
    keys = {
      {
        "<leader>ff",
        function()
          LazyVim.pick("files", { root = false })()
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fF",
        function()
          LazyVim.pick("files")()
        end,
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>sg",
        function()
          LazyVim.pick("live_grep", { root = false })()
        end,
        desc = "Grep (cwd)",
      },
      {
        "<leader>sG",
        function()
          LazyVim.pick("live_grep")()
        end,
        desc = "Grep (Root Dir)",
      },
      {
        "<leader>/",
        function()
          LazyVim.pick("live_grep", { root = false })()
        end,
        desc = "Grep (cwd)",
      },
    },
  },
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {},
    lazy = false,
  },
}
