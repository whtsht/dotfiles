vim.api.nvim_create_augroup("userconfig", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("userconfig", { clear = true }),
  desc = "automatically format files when saving",
  pattern = "*",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients({ bufnr = bufnr })

    for _, client in ipairs(clients) do
      if client.server_capabilities.documentFormattingProvider then
        vim.lsp.buf.format({ async = false, bufnr = bufnr })
        return
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = "userconfig",
  desc = "return cursor to where it was last time closing the file",
  pattern = "*",
  command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = "userconfig",
  desc = "automatically disable spell check when enter term mode",
  pattern = "*",
  command = "setlocal nospell | startinsert",
})
