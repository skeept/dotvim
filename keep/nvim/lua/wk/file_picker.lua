local M = {}

-- Open files after the picker exits
local function open_files(temp_file_path)
  if vim.fn.filereadable(temp_file_path) == 0 then
    return
  end

  local names = vim.fn.readfile(temp_file_path)
  vim.fn.delete(temp_file_path)

  if vim.tbl_isempty(names) then
    return
  end

  -- Build a list of commands to run
  local cmds = { "edit " .. vim.fn.fnameescape(names[1]) }
  for i = 2, #names do
    table.insert(cmds, "argadd " .. vim.fn.fnameescape(names[i]))
  end

  -- Execute each command individually in a loop
  for _, command in ipairs(cmds) do
    vim.cmd(command)
  end
end

-- Pick the right file picker command
local function get_picker_cmd(temp_file_path, args)
  if vim.fn.executable("lf") == 1 then
    return vim.list_extend({ "lf", "-selection-path", temp_file_path }, args or {})
  elseif vim.fn.executable("ranger") == 1 then
    return vim.list_extend({ "ranger", "--choosefiles=" .. temp_file_path }, args or {})
  elseif vim.fn.executable("nnn") == 1 then
    return vim.list_extend({ "nnn", "-p", temp_file_path }, args or {})
  else
    vim.notify("No file picker (lf, ranger, nnn) found in PATH.", vim.log.levels.ERROR)
    return {}
  end
end

-- The main logic for opening the file picker
local function filepicker(opts)
  opts = opts or {}
  local args = opts.args and vim.split(opts.args, " ") or {}
  local temp = vim.fn.tempname()

  local cmd = get_picker_cmd(temp, args)
  if vim.tbl_isempty(cmd) then
    return
  end

  -- Create a floating terminal window and get its handle
  local term_buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local win_opts = {
    relative = "editor",
    width = width,
    height = height,
    row = (vim.o.lines - height) / 2,
    col = (vim.o.columns - width) / 2,
    style = "minimal",
    border = "rounded",
  }
  local term_win = vim.api.nvim_open_win(term_buf, true, win_opts)

  -- Define the on_exit callback inside this function so it can access 'term_win'
  local on_exit_callback = vim.schedule_wrap(function()
    -- 1. First, close the terminal window we created
    if vim.api.nvim_win_is_valid(term_win) then
      vim.api.nvim_win_close(term_win, true)
    end
    -- 2. Now that focus is back on the main window, open the files
    open_files(temp)
  end)

  -- Start the job and attach it to the new terminal buffer
  vim.fn.termopen(cmd, { on_exit = on_exit_callback })

  -- Automatically enter terminal mode
  vim.cmd("startinsert")
  -- --- END FIX ---
end

-- The public setup function that will be called by lazy.nvim
function M.setup()
  vim.api.nvim_create_user_command("FilePicker", function(o)
    filepicker({ args = o.args })
  end, { nargs = "?", complete = "dir" })
end

return M
