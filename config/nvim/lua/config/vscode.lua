if vim.g.vscode then
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "setlocal nospell",
  })
end
