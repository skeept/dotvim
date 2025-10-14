local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ───────────────────────────────────────────────────────────────
-- Detect RHEL8 or old glibc system (glibc 2.28)
-- ───────────────────────────────────────────────────────────────
local uname = vim.loop.os_uname()
local is_rhel8 = uname.release:match("el8") or uname.version:match("glibc 2%.28")

if is_rhel8 then
  vim.schedule(function()
    vim.notify(
      "Detected RHEL8 (glibc 2.28) — disabling Tree-sitter to avoid GLIBC errors.",
      vim.log.levels.WARN
    )
  end)
end

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },

    -- ─────────────────────────────────────────────
    -- Disable Tree-sitter auto-builds on RHEL8
    -- ─────────────────────────────────────────────
    is_rhel8
        and {
          "nvim-treesitter/nvim-treesitter",
          opts = {
            ensure_installed = {},
            auto_install = false,
            highlight = { enable = false },
          },
          build = ":echo 'Skipping tree-sitter build (glibc too old)'",
        }
      or nil,
  },

  defaults = {
    lazy = false,
    version = false,
  },

  install = { colorscheme = { "tokyonight", "habamax" } },

  checker = {
    enabled = true,
    notify = false,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
