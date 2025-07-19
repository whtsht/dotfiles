-- Lspconfig
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

lspconfig.clangd.setup{}

lspconfig.yamlls.setup{}

-- Lspsaga
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
