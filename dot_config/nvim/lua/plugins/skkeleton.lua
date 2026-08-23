return {
  "vim-skk/skkeleton",
  lazy = false,
  dependencies = {
    "vim-denops/denops.vim"
  },
  config = function()
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
      ['('] = {'（', ''},
      [')'] = {'）', ''},
    })

    vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)", { silent = true })
    vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-enable)", { silent = true })
    vim.keymap.set("t", "<C-j>", "<Plug>(skkeleton-enable)", { silent = true })
  end
}
