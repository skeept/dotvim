return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/wk",
    name = "file_picker",
    lazy = true,
    cmd = { "FilePicker" },
    keys = {
      { "<leader>fp", "<cmd>FilePicker<cr>", desc = "Open FilePicker" },
    },
    config = function()
      require("wk.file_picker").setup()
    end,
  },
  {
    dir = vim.fn.stdpath("config") .. "/lua/wk",
    name = "capture",
    lazy = true,
    cmd = { "CaptureOutput", "CaptureToScratch" },
    keys = {
      { "<Leader>oo", ":CaptureToScratch<space>", desc = "Capture output to scratch" },
      { "<Leader>oc", ":CaptureOutput<space>", desc = "Capture output" },
      { ",cs", ":CaptureToScratch<space>", desc = "Capture output to scratch" },
      { ",co", ":CaptureOutput<space>", desc = "Capture output" },
    },
    config = function()
      require("wk.capture").setup()
    end,
  },
}
