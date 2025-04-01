-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
--
-- this config disables some default plugins enabled in LazyVim
return {

  {
    "folke/noice.nvim",
    enabled = false,
    -- opts = {
    --   cmdline = { enabled = false },
    -- },
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
