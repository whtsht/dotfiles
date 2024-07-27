if vim.g.vscode then
  return {
    -- disable plugins
    { "nvimdev/dashboard-nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "rafamadriz/friendly-snippets", enabled = false },
    { "shortcuts/no-neck-pain.nvim", enabled = false },
    { "nvim-telescope/telescope.nvim", enabled = false },
    { "williamboman/mason-lspconfig.nvim", enabled = false },
    { "vim-skk/skkeleton", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
  }
else
  return {
    -- disable plugins
    { "nvimdev/dashboard-nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "rafamadriz/friendly-snippets", enabled = false },
  }
end
