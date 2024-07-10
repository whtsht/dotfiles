require("config.lazy")
require("config.workspace")
if vim.g.neovide then
  require("config.neovide")
end

-- local lsp_servers = {
--   -- Python
--   "pyright",
--   -- Java
--   "jdtls",
--   -- GO
--   "gopls",
--   -- Idris
--   "idris2_lsp",
--   -- Lua
--   "lua_ls",
--   -- Ruby
--   "solargraph",
--   -- Code spell checker
--   "typos_lsp",
--   -- ruby
--   "steep"
-- }
--
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- for _, server in pairs(lsp_servers) do
--   lspconfig[server].setup({
--     root_dir = lspconfig.util.root_pattern(".git"),
--     capabilities = capabilities,
--   })
-- end

-- steep
lspconfig.steep.setup({
  root_dir = lspconfig.util.root_pattern(".git"),
  capabilities = capabilities,
  -- cmd = docker compose run --rm rails bundle exec steep langserver
  -- cmd = { "docker", "compose", "run", "--rm", "rails", "bundle", "exec", "steep", "langserver" },
  cmd = { "docker", "compose", "run", "--rm", "app", "bundle", "exec", "steep", "langserver" },
  -- cmd = { "steep", "langserver" },
})

-- solargraph
-- lspconfig.solargraph.setup({
--   root_dir = lspconfig.util.root_pattern(".git"),
--   capabilities = capabilities,
--   cmd = { "docker", "compose", "run", "--rm", "rails", "solargraph", "stdio" },
-- })

-- ruby-lsp
-- lspconfig.ruby_lsp.setup({
--   root_dir = lspconfig.util.root_pattern(".git"),
--   capabilities = capabilities,
--   cmd = { "docker", "compose", "run", "--rm", "rails", "bundle", "exec", "ruby-lsp" },
-- })
