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
        cmd = { 'bundle', 'exec', 'ruby-lsp' },
        settings = {
          ruby = {
            format = {
              command = "rubocop"
            },
          },
        },
      })
      setup_server('gopls')
      setup_server('pyright')
      setup_server('efm', {
        init_options = { documentFormatting = true },
        settings = {
          rootMarkers = {".git/"},
          languages = {
            python = {
              {
                formatCommand = "black --quiet -",
                formatStdin = true
              }
            }
          }
        }
      })
      require('lspconfig.configs').ruby_analyzer = {
        default_config = {
          cmd = { "ruby-analyzer" },
          filetypes = { "ruby" },
          root_dir = require('lspconfig').util.root_pattern("Cargo.toml"),
          settings = {},
        },
      }
      setup_server('ruby_analyzer')
      vim.lsp.set_log_level("INFO")
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
