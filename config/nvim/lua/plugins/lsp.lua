return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig').rust_analyzer.setup {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
          },
        },
      },
    }

    require('lspconfig').ruby_lsp.setup {
      capabilities = capabilities,
      settings = {
        ruby = {
          format = {
            command = "rubocop"
          },
        },
      },
    }

    require('lspconfig').solargraph.setup {
      capabilities = capabilities,
    }
  end
}
