return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets'
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" }
    })

    local ls = require("luasnip")
    vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
  end
}
