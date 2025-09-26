local M = {}

-- The core calculation and display logic
function M.hours_minutes(total_str, denominator)
  local total = tonumber(total_str)
  if not total then
    vim.notify("Error: Input is not a valid number.", vim.log.levels.ERROR)
    return
  end

  -- Perform the calculations
  local hours = math.floor(total / denominator)
  local minutes_left = math.floor((total - (hours * denominator)) / 60)
  local days = math.floor(hours / 24)
  local additional_hours = hours % 24

  -- Build the output message
  local msg = hours .. " h"
  if minutes_left > 0 then
    msg = msg .. " " .. minutes_left .. " m"
  end
  if days > 0 then
    msg = msg .. " [ " .. days .. " days " .. additional_hours .. " hours ]"
  end

  vim.notify(msg, vim.log.levels.INFO)
end

-- A setup function to create the command and keymaps
function M.setup()
  -- Create the :HoursMinutes command
  vim.api.nvim_create_user_command("HoursMinutes", function()
    local cword = vim.fn.expand("<cword>")
    M.hours_minutes(cword, 3600)
  end, { nargs = 0 })

  -- Create the keymaps
  vim.keymap.set(
    "n",
    "<F9>",
    "<Cmd>HoursMinutes<CR>",
    { silent = true, desc = "Calculate hours/minutes" }
  )
  vim.keymap.set(
    "n",
    "<S-F9>",
    ":HoursMinutes<Space>",
    { noremap = true, desc = "Edit hours/minutes calculation" }
  )
  vim.keymap.set("i", "<S-F8>", "<C-R>=3600*<CR>", { desc = "Insert 3600*" })
end

return M
