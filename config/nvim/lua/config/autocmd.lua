-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs,*py,*.go,*.ts,*.tsx,*.js,*.jsx",
  group = augroup,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
