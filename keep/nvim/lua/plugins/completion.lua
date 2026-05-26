return {
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (Tab to accept / navigate)
      -- 'enter' for enter to accept
      keymap = { preset = "super-tab" },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },

      -- Function signature hints while typing (e.g. param names and types).
      -- To disable: set `signature = { enabled = false }` or remove this block.
      signature = { enabled = true },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = { implementation = "prefer_rust" },
    },
    opts_extend = { "sources.default" },
  },

  -- Prevent LuaSnip from claiming <Tab>/<S-Tab> so blink.cmp owns them.
  -- LuaSnip is still available as a snippet engine; this only removes its keymaps.
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
