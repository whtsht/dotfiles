require('config.option')
require('config.keymap')
require('config.lazy')
require('config.lsp')
require('config.command')
if vim.g.neovide then
  require('config.neovide')
end
