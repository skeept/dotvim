return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",
    "marko-cerovac/material.nvim",
    "molok/vim-scratch",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "onedark",
      colorscheme = "material",
    },
  },
}
