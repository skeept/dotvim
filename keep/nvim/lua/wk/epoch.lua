local M = {}

local config = {
  offset_hours = 6,
  format_idx = 1,
  formats = {
    "%m/%d %H:%M",
    "%a, %d %b %Y %H:%M:%S %p",
  },
}

-- Internal state for the module
local state = {
  write_mode = false,
  show_adjusted = false,
  previous_val = nil,
}

-- Private helper function to do the core conversion and message building
local function _get_conversion_message()
  local cword = vim.fn.expand("<cword>")
  local current_val = tonumber(cword)
  if not current_val then
    return nil, "Not a valid epoch timestamp."
  end

  local adjusted_val = current_val + (config.offset_hours * 3600)
  local format = config.formats[config.format_idx]
  local time_display = vim.fn.strftime(format, current_val)

  if state.show_adjusted then
    time_display = time_display .. " | Adjusted: " .. vim.fn.strftime(format, adjusted_val)
  end

  local hours_diff = ""
  if state.previous_val and current_val ~= state.previous_val then
    local diff_secs = current_val - state.previous_val
    local sign = diff_secs >= 0 and "+" or "-"
    diff_secs = math.abs(diff_secs)
    local diff_h = math.floor(diff_secs / 3600)
    local diff_m = math.floor((diff_secs % 3600) / 60)
    hours_diff = string.format(" (Diff: %s%dh %dm)", sign, diff_h, diff_m)
  end
  state.previous_val = current_val

  return time_display .. hours_diff, nil
end

-- The dispatcher function with corrected [count] logic
function M.convert_time_with_count()
  local count = vim.v.count1 -- Use count1 as it defaults to 1

  if count == 2 then -- Toggle Write Mode
    state.write_mode = not state.write_mode
    local status = state.write_mode and "ON" or "OFF"
    local message = "Write mode is now " .. status
    vim.notify(message, vim.log.levels.INFO, { title = "Epoch Time" })
    print(message)
  elseif count == 3 then -- Toggle 'show_adjusted' setting
    state.show_adjusted = not state.show_adjusted
    local status = state.show_adjusted and "ON" or "OFF"
    local message = "Show adjusted time is now " .. status
    vim.notify(message, vim.log.levels.INFO, { title = "Epoch Time" })
    print(message)
  else -- Default action (no count, or a count of 1)
    if state.write_mode then
      -- Write to buffer
      local message, err = _get_conversion_message()
      if err then
        vim.notify(err, vim.log.levels.WARN)
        print(err)
        return
      end
      vim.cmd("normal! e")
      vim.api.nvim_put({ " " .. message }, "c", true, true)
    else
      -- Show notification
      local message, err = _get_conversion_message()
      if err then
        vim.notify(err, vim.log.levels.WARN)
        print(err)
        return
      end
      vim.notify(message, vim.log.levels.INFO, { title = "Epoch Time" })
      print(message)
    end
  end
end

return M
