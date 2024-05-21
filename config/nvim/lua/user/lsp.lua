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
}
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, server in pairs(lsp_servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
	})
end

-- Rust
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
	capabilities = capabilities,
})
