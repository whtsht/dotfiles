return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local loader = require("luasnip.loaders.from_vscode")
    loader.lazy_load({ paths = { "./snippets" } })
    loader.lazy_load()
  end,
}
