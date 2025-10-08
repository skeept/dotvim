return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local is_windows = vim.loop.os_uname().version:match("Windows")
      if is_windows and opts.servers then
        opts.servers.pyright = nil
      end
    end,
  },
}
