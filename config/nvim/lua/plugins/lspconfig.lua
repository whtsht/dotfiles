local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

-- Typescript
local is_node_dir = function()
  return lspconfig.util.root_pattern("package.json")(vim.fn.getcwd())
end

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = function(client)
    if not is_node_dir() then
      client.stop(true)
    end
  end,
})

lspconfig.denols.setup({
  capabilities = capabilities,
  on_attach = function(client)
    if is_node_dir() then
      client.stop(true)
    end
  end,
})

lspconfig.lua_ls.setup {}
lspconfig.emmet_language_server.setup {}
lspconfig.svelte.setup {}
lspconfig.crystalline.setup {}
lspconfig.typeprof.setup {
  cmd = { "bundle", "exec", "~/Code/Ruby/typeprof/bin/typeprof", '--lsp', '--stdio' }
}
lspconfig.clangd.setup{}
