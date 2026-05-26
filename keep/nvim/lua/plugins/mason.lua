return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local is_windows = (vim.uv or vim.loop).os_uname().sysname:find("Windows")
      if is_windows and opts.servers then
        opts.servers.pyright = nil
      end
    end,
  },
}
