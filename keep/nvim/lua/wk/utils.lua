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

function M.uniq(opts)
  local start_line = opts.line1
  local end_line = opts.line2

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local unique_lines = {}
  local seen = {}
  for _, line in ipairs(lines) do
    if not seen[line] then
      table.insert(unique_lines, line)
      seen[line] = true
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, unique_lines)
end

-- Corresponds to :ChgDirCurrFileFolder
function M.change_dir(opts)
  -- The count from the command. Defaults to 0 if no count is given.
  local count = opts.count or 0
  print(opts.count)

  -- Build the expand modifier string. e.g., for a count of 1, this becomes ':p:h:h'
  local modifier = ":p:h" .. string.rep(":h", count)
  local dir = vim.fn.expand("%" .. modifier)

  if dir == "" then
    vim.notify("Not in a file buffer or path is too short.", vim.log.levels.WARN)
    return
  end

  -- Use :cd! for global change with '!' or :lcd for local change
  local cmd = opts.bang and "cd!" or "lcd"
  vim.cmd(cmd .. " " .. vim.fn.fnameescape(dir))
  vim.cmd("pwd") -- Show the new directory
end

-- Corresponds to :QuoteCommaJoin
function M.quote_comma_join(opts)
  local start_line = opts.line1
  local end_line = opts.line2

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local processed_lines = {}

  for _, line in ipairs(lines) do
    -- Trim whitespace and format the line
    table.insert(processed_lines, '"' .. vim.fn.trim(line) .. '",')
  end

  -- Join into a single line, remove the last comma
  local final_line = table.concat(processed_lines, " ")
  final_line = final_line:gsub(",$", "") -- Remove trailing comma

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, { final_line })
end

return M
