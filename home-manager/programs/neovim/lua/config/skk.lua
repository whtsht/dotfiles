vim.fn['skkeleton#config']({
  globalDictionaries = {
    { '~/.skk/SKK-JISYO.L', 'euc-jp' }
  }
})

vim.fn['skkeleton#register_kanatable']('rom', {
  ['jj'] = 'escape',
})

if vim.bo.filetype == 'tex' then
  vim.fn['skkeleton#register_kanatable']('rom', {
    [','] = {'，', ''},
    ['.'] = {'．', ''},
  })
end

vim.fn['skkeleton#register_kanatable']('rom', {
  ['['] = {'[', ''},
  [']'] = {']', ''},
})
