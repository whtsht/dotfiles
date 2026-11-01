vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd("tabnew " .. vim.lsp.log.get_filename())
end, {})

vim.api.nvim_create_autocmd({ "TermOpen", "BufWinEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.opt_local.spell = false
  end,
})
