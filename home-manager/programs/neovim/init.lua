require("config.options")
require("config.keymap")
require("config.autocmd")
require("config.fzf")
require("config.cmp")
require("config.lsp")
require("config.skk")
require("config.term")
require("config.treesitter")
require("config.git")

if vim.g.vscode then
  vim.opt.spell = false
end
