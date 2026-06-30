return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/wk",
    name = "wk_custom_tools",
    lazy = true,
    -- Tell lazy.nvim all the commands this toolkit provides
    cmd = { "FilePicker", "CaptureOutput", "CaptureToScratch", "DiffOtherFile" },
    -- Tell lazy.nvim all the keys that should trigger this toolkit
    keys = {
      -- File Picker
      { "<leader>fp", "<cmd>FilePicker<cr>", desc = "Open FilePicker" },

      -- Capture Output
      { "<Leader>oo", ":CaptureToScratch<space>", desc = "Capture output to scratch" },
      { "<Leader>oc", ":CaptureOutput<space>", desc = "Capture output" },
      { ",cs", ":CaptureToScratch<space>", desc = "Capture output to scratch" },
      { ",co", ":CaptureOutput<space>", desc = "Capture output" },

      -- Diff Switcher (CRITICAL: Note the capital 'O' in DiffOtherFile)
      { "<leader>df", "<cmd>DiffOtherFile<cr>", desc = "Diff another file in BL/TR pairs" },
    },
    config = function()
      -- Load all of your custom module setups together cleanly
      require("wk.file_picker").setup()
      require("wk.capture").setup()
      require("wk.diff_switcher").setup()
    end,
  },
}
