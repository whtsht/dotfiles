return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        winblend = 0,
        expand = "",
        collapse = "",
        preview = "",
        code_action = "",
      },
    })
  end
}
