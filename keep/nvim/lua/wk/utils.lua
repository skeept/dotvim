local M = {}

-- Track if the keymaps have been registered yet
local hours_minutes_keymaps_set = false

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
  print(msg) -- write it in last row
end

-- A setup function to create the command
function M.setup()
  -- Create the :HoursMinutes command
  vim.api.nvim_create_user_command("HoursMinutes", function(opts)
    -- Check if we need to inject the keymaps
    if not hours_minutes_keymaps_set then
      -- <F9>: Instantly calculate using the word under the cursor
      vim.keymap.set(
        "n",
        "<F9>",
        "<Cmd>HoursMinutes<CR>",
        { silent = true, desc = "Calculate hours/minutes" }
      )

      vim.keymap.set(
        "i",
        "<F8>",
        "<C-o>ciw<C-R>=3600*",
        { desc = "Replace current word with 3600*" }
      )
      vim.keymap.set("n", "<F8>", "ciw<C-R>=3600*", { desc = "Replace word with 3600*" })

      hours_minutes_keymaps_set = true
      -- Set flag to true so this block never runs again

      -- Format a scannable message showing the new layout
      local msg = table.concat({
        "HoursMinutes Mode Active! Mappings loaded:",
        "  <F9> (Normal) → Calculate word under cursor",
        "  <F8> (Normal) → Change word to '3600*'",
        "  <F8> (Insert) → Insert '3600*' calculations",
      }, "\n")

      -- Notify with a 2-second (2000ms) duration wrapper
      vim.notify(msg, vim.log.levels.INFO, {
        title = "HoursMinutes Setup",
        timeout = 3000,
      })
    end

    -- Run the actual command logic
    local input = opts.args ~= "" and opts.args or vim.fn.expand("<cword>")
    M.hours_minutes(input, 3600)
  end, { nargs = "?" })
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

function M.close_tab_or_exit(idx)
  if idx == 0 then
    vim.cmd("wall")
  end

  local is_diff = vim.wo.diff
  local is_dirdiff = false

  local current_tab = vim.api.nvim_get_current_tabpage()
  local windows = vim.api.nvim_tabpage_list_wins(current_tab)

  for _, win in ipairs(windows) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    local has_var, _ = pcall(vim.api.nvim_buf_get_var, bufnr, "currentDiff")
    if has_var then
      is_dirdiff = true
      break
    end
  end

  local total_tabs = #vim.api.nvim_list_tabpages()
  local win_count_in_tab = #windows

  if total_tabs > 1 then
    if win_count_in_tab == 1 then
      vim.cmd("xit")
    else
      vim.cmd("tabclose")
    end
  elseif is_diff or is_dirdiff then
    vim.cmd("qall")
  else
    vim.cmd("xit")
  end
end

return M
