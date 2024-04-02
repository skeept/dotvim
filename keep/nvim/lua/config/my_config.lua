local function DeltTrailingSpace()
  vim.cmd([[
normal mz
normal Hmy
]])
end

vim.api.nvim_create_user_command("DeltTrailingSpace", DeltTrailingSpace, {
  desc = "delete trailing whitespace",
})

local function CaptureOutput(use_scractch, cmd_)
  local more_opt = vim.go.more
  vim.cmd("redir => captured")
  vim.cmd("silent " .. cmd_)
  vim.cmd("redir END")
  if use_scractch then
    vim.cmd("Sscratch")
  end
  vim.cmd("normal G")
  vim.cmd("put=captured")
  vim.o.more = more_opt
end

vim.api.nvim_create_user_command("CaptureOutput", function(args)
  CaptureOutput(false, args.args)
end, {
  desc = "capture output",
  nargs = "+",
})

vim.api.nvim_create_user_command("CaptureToSractch", function(args)
  CaptureOutput(true, args.args)
end, {
  desc = "capture output to scratch buffer",
  nargs = "+",
})

vim.keymap.set("n", "<Leader>oo", ":CaptureToSractch<space>")
vim.keymap.set("n", "<Leader>oc", ":CaptureOutput<space>")
