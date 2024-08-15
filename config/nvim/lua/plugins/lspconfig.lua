return {
  "williamboman/mason-lspconfig.nvim",
  requires = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })

        -- C/C++ lsp settings
        lspconfig.clangd.setup({
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
          },
        })
      end,
    })
  end,
  opts = {
    format = { timeout_ms = 1000 },
  },
}
