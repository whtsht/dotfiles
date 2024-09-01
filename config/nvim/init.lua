require("config.lazy")
vim.g.denops_disable_version_check = true
if vim.g.neovide then
  require("config.neovide")
end
