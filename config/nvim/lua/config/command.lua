vim.api.nvim_create_user_command('CopyFilePath', function()
  local filepath = vim.fn.expand('%:p')
  vim.fn.setreg('+', filepath)
end, {})

vim.api.nvim_create_user_command('CopyFileName', function()
  local filename = vim.fn.expand('%:t')
  vim.fn.setreg('+', filename)
end, {})
