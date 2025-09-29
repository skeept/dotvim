local M = {}

-- Helper to get the "prefix" (indentation + first word) of a line.
local function _get_prefix(line)
  if line == nil or line == "" then
    return nil
  end
  return string.match(line, "^%s*%S+")
end

-- The main function, now with a corrected and simpler search pattern.
function M.jump_to_block_boundary(direction)
  local count = vim.v.count1 -- Defaults to 1 if no count is provided

  for _ = 1, count do
    local current_line = vim.api.nvim_get_current_line()
    local prefix = _get_prefix(current_line)

    if not prefix then
      vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] + direction, 0 })
      goto continue -- Skip the search for empty lines
    end

    local escaped_prefix = vim.fn.escape(prefix, [[\/.*[]^%${}]]) -- Escaped for regex

    -- *** THE FIX IS HERE: A much simpler and more reliable regex ***
    -- This pattern looks for a line that does NOT start with the escaped prefix.
    local search_pattern = string.format([[\v^%%(%s)@!.]], escaped_prefix)

    -- 'b' flag searches backwards, 'W' prevents wrap-around at end of file
    local flags = direction > 0 and "W" or "bW"

    vim.fn.search(search_pattern, flags)
    ::continue::
  end
  vim.cmd("normal! zz") -- Center the screen on the final destination
end

-- The setup function remains the same.
function M.setup()
  vim.keymap.set("n", ",n", function()
    M.jump_to_block_boundary(1)
  end, { desc = "Jump to start of next block" })
  vim.keymap.set("n", ",N", function()
    M.jump_to_block_boundary(-1)
  end, { desc = "Jump to start of current/prev block" })
end

return M
