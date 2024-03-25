local function DeltTrailingSpace()
  vim.cmd([[
normal mz
normal Hmy
]])
end

vim.api.nvim_create_user_command("DeltTrailingSpace", DeltTrailingSpace, {
  desc = "delete trailing whitespace",
})
