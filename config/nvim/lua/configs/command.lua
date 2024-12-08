vim.api.nvim_create_user_command('YankFilePath', function()
  local filepath = vim.fn.expand('%:p')
  vim.fn.setreg('+', filepath)
end, {})

vim.api.nvim_create_user_command('YankFileName', function()
  local filename = vim.fn.expand('%:t')
  vim.fn.setreg('+', filename)
end, {})
