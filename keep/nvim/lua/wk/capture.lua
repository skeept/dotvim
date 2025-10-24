local M = {}

function M.setup()
  local function CaptureOutput(use_scratch, cmd_)
    local ok, result = pcall(vim.api.nvim_exec2, "silent " .. cmd_, { output = true })
    if not ok then
      vim.notify("Error running command: " .. cmd_, vim.log.levels.ERROR)
      return
    end

    local lines = vim.split(result.output or "", "\n", { trimempty = true })
    if use_scratch then
      vim.cmd("Sscratch")
    end
    vim.api.nvim_buf_set_lines(0, -1, -1, false, lines)
  end

  -- User commands (only defined when plugin is loaded)
  vim.api.nvim_create_user_command("CaptureOutput", function(args)
    CaptureOutput(false, args.args)
  end, { desc = "Capture output", nargs = "+", complete = "command" })

  vim.api.nvim_create_user_command("CaptureToScratch", function(args)
    CaptureOutput(true, args.args)
  end, { desc = "Capture output to scratch buffer", nargs = "+", complete = "command" })
end

return M
