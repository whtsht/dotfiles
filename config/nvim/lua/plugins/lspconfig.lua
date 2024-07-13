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

        -- Ruby lsp settings
        lspconfig.solargraph.setup({
          root_dir = lspconfig.util.root_pattern(".git", "Gemfile"),
          capabilities = capabilities,
          cmd = { "docker", "compose", "run", "--rm", "rails", "solargraph", "stdio" },
        })
      end,
    })
  end,
  opts = {
    format = { timeout_ms = 1000 },
  },
}
