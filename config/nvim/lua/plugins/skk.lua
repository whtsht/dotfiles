vim.fn['skkeleton#config']({
  globalDictionaries = {
    { '~/.skk/SKK-JISYO.L', 'euc-jp' }
  }
})

vim.fn['skkeleton#register_kanatable']('rom', {
  ['jj'] = 'escape',
  ['kk'] = 'escape',
})

vim.fn['skkeleton#register_kanatable']('rom', {
  [','] = {'，', ''},
  ['.'] = {'．', ''},
})
