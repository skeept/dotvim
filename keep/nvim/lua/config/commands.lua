-- Definition of vim commands

vim.api.nvim_create_user_command("PopulateQF", function(opts)
  -- Get the arguments provided by the user.
  local original_args = opts.fargs

  -- Manually expand any special Vim characters like '%' or '#'.
  local expanded_args = {}
  for _, arg in ipairs(original_args) do
    table.insert(expanded_args, vim.fn.expand(arg))
  end

  -- Use the expanded arguments from now on.
  local args = expanded_args

  if #args == 0 then
    vim.notify("PopulateQF: No command provided.", vim.log.levels.WARN)
    return
  end

  local cmd
  local title
  local tool = args[1]

  if tool == "ruff" then
    table.remove(args, 1)
    cmd = { "ruff", "check", "--output-format=concise" }
    vim.list_extend(cmd, args)
    title = "Ruff Check"
  else
    cmd = args
    title = table.concat(cmd, " ")
  end

  vim.notify("Running: " .. table.concat(cmd, " "), vim.log.levels.INFO)

  local output = vim.fn.systemlist(cmd)

  if vim.v.shell_error ~= 0 and #output == 0 then
    vim.notify(
      "PopulateQF: Command failed with exit code " .. vim.v.shell_error,
      vim.log.levels.ERROR
    )
    return
  end

  vim.fn.setqflist({}, "r", { title = title, lines = output })
  vim.cmd("copen")
end, {
  nargs = "+",
  complete = "file", -- 'file' completion works well with expand()
})
