return {
  "vim-skk/skkeleton",
  config = function()
    vim.fn["skkeleton#config"]({
      globalDictionaries = {
        vim.fn.expand("~") .. "/.skk/SKK-JISYO.L",
      },
    })
  end,
  dependencies = { "vim-denops/denops.vim" },
}
