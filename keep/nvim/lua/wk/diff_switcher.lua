local M = {}

function M.setup()
  local function diff_other_file()
    local current_file = vim.api.nvim_buf_get_name(0)
    local common_path = nil
    local sep = "/"

    -- 1. Detect if we are looking at BL or TR and extract the common base path
    local bl_start = current_file:find("[/\\]BL[/\\]")
    local tr_start = current_file:find("[/\\]TR[/\\]")

    if bl_start then
      common_path = current_file:sub(1, bl_start - 1)
      sep = current_file:sub(bl_start, bl_start)
    elseif tr_start then
      common_path = current_file:sub(1, tr_start - 1)
      sep = current_file:sub(tr_start, tr_start)
    else
      vim.notify("Current file is not in a BL or TR directory", vim.log.levels.WARN)
      return
    end

    -- 2. Read all files in the BL directory to provide a selection list
    local bl_path = common_path .. sep .. "BL"
    local ok, files = pcall(vim.fn.readdir, bl_path)
    if not ok or #files == 0 then
      vim.notify("Could not read BL directory or it is empty", vim.log.levels.ERROR)
      return
    end

    -- 3. Present a selection menu to the user
    vim.ui.select(files, {
      prompt = "Select file to diff:",
    }, function(choice)
      if not choice then
        return
      end

      -- CRITICAL: Reset diff mode globally before changing files to prevent layout corruption
      vim.cmd("diffoff!")

      local wins = vim.api.nvim_tabpage_list_wins(0)
      local target_wins = {}

      -- 4. Load the new files into their respective windows
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        local new_path = nil

        if buf_name:find("[/\\]BL[/\\]") then
          new_path = common_path .. sep .. "BL" .. sep .. choice
        elseif buf_name:find("[/\\]TR[/\\]") then
          new_path = common_path .. sep .. "TR" .. sep .. choice
        end

        if new_path then
          table.insert(target_wins, win)
          vim.api.nvim_win_call(win, function()
            vim.cmd("edit " .. vim.fn.fnameescape(new_path))
          end)
        end
      end

      -- 5. Re-enable diff mode strictly on the windows we just changed
      for _, win in ipairs(target_wins) do
        vim.api.nvim_win_call(win, function()
          vim.cmd("diffthis")
        end)
      end

      -- Force recalculate the fresh diff
      vim.cmd("diffupdate")
    end)
  end

  -- THIS WAS MISSING: Actually register the command so Neovim knows what to run!
  vim.api.nvim_create_user_command("DiffOtherFile", diff_other_file, {
    desc = "Diff another file in BL/TR pairs",
  })
end

return M
