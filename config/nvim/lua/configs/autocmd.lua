vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
  callback = function()
    vim.cmd("silent! normal! g`\"zv")
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('mkdir', { clear = true }),
  pattern = '*',
  callback = function(args)
    local dir = vim.fn.fnamemodify(args.file, ':p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})
