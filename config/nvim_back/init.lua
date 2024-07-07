require("core.workspace")

require("user.options")
require("user.plugins")
require("user.mappings")
require("user.lsp")
require("user.cmp")
require("user.autocmd")
if vim.g.neovide then
  require("user.neovide")
end
