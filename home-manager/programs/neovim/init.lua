require("config.options")
require("config.keymap")
require("config.fzf")
require("config.cmp")
require("config.lsp")
require("config.skk")

if vim.g.vscode then
  vim.opt.spell = false
end
