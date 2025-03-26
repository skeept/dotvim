return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",
    "marko-cerovac/material.nvim",
    "molok/vim-scratch",
    "neanias/everforest-nvim",
    "cpea2506/one_monokai.nvim",
    "projekt0n/github-nvim-theme",
    "olimorris/onedarkpro.nvim",
    "sainnhe/sonokai",
    "rebelot/kanagawa.nvim",
    "yorumicolors/yorumi.nvim",
    "shaunsingh/nord.nvim",
    "AlexvZyl/nordic.nvim",
    "bluz71/vim-moonfly-colors",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "onedark",
      -- colorscheme = "material",
      -- colorscheme = "desert",
      -- colorscheme = "sonokai",
      -- colorscheme = "tokyonight-night",
      colorscheme = "moonfly",
      -- colorscheme = "yorumi",
    },
  },
}
