if vim.g.vscode then
  return {
    { "nvimdev/dashboard-nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "rafamadriz/friendly-snippets", enabled = false },
    { "shortcuts/no-neck-pain.nvim", enabled = false },
    { "nvim-telescope/telescope.nvim", enabled = false },
    { "williamboman/mason-lspconfig.nvim", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "hrsh7th/nvim-cmp", enabled = false },
    { "zbirenbaum/copilot.lua", enabled = false },
    { "zbirenbaum/copilot-cmp", enabled = false },
    { "echasnovski/mini.pairs", enabled = false },
  }
else
  return {
    { "nvimdev/dashboard-nvim", enabled = false },
    { "akinsho/bufferline.nvim", enabled = false },
    { "rafamadriz/friendly-snippets", enabled = false },
    { "echasnovski/mini.pairs", enabled = false },
  }
end
