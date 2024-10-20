return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local function setup_server(name, opts)
        require('lspconfig')[name].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
        }, opts or {}))
      end
      setup_server('rust_analyzer', {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
          },
        },
      })
      setup_server('ruby_lsp', {
        settings = {
          ruby = {
            format = {
              command = "rubocop"
            },
          },
        },
      })
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        ui = {
          winbar_prefix = '',
          border = 'rounded',
          devicon = true,
          foldericon = true,
          title = true,
          expand = '⊞',
          collapse = '⊟',
          code_action = '',
          lines = { '┗', '┣', '┃', '━', '┏' },
          kind = nil,
          button = { '', '' },
          imp_sign = '󰳛 ',
          use_nerd = true,
        },
        scroll_preview = {
          scroll_down = '<C-j>',
          scroll_up = '<C-k>',
        },
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  }
}
