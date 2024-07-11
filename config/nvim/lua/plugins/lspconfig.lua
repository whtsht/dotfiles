return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Ruby lsp settings
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.solargraph.setup({
      root_dir = lspconfig.util.root_pattern(".git"),
      capabilities = capabilities,
      cmd = { "docker", "compose", "run", "--rm", "rails", "solargraph", "stdio" },
    })

    lspconfig.ruby_lsp.setup({
      root_dir = lspconfig.util.root_pattern(".git"),
      capabilities = capabilities,
      cmd = { "docker", "compose", "run", "--rm", "rails", "bundle", "exec", "ruby-lsp" },
    })
  end,
}
