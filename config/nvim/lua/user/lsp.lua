local lsp_servers = {
  -- Python
  "pyright",
  -- Java
  "jdtls",
  -- GO
  "gopls",
  -- Idris
  "idris2_lsp",
  -- Lua
  "lua_ls",
  -- Ruby
  "solargraph",
  -- Code spell checker
  "typos_lsp",
  -- Haskell
  "hls",
}
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, server in pairs(lsp_servers) do
  lspconfig[server].setup({
    root_dir = lspconfig.util.root_pattern(".git"),
    capabilities = capabilities,
  })
end

-- Rust
lspconfig.rust_analyzer.setup({
  root_dir = lspconfig.util.root_pattern(".git"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
  capabilities = capabilities,
})

-- efm language server
lspconfig.efm.setup({
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      python = {
        {
          formatCommand = "black --quiet -",
          formatStdin = true,
        }
      },
    },
  },
  filetypes = { "python" }
})
