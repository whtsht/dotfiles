-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs,*py,*.go",
  group = augroup,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
