vim.call('ddu#custom#patch_global', {
  ui = 'ff',
  uiParams = {
    ff = {
      filterFloatingPosition = "top",
      filterSplitDirection = "floating",
      floatingBorder = "rounded",
      prompt = "> ",
      split = "floating",
      startFilter = true,
    },
  },
  sourceOptions = {
    _ = {
      matchers = { 'matcher_substring' },
    },
  },
})

vim.call('ddu#custom#patch_local', 'node-files', {
  sources = { 'file_rec' },
  sourceParams = {
    file_rec = {
      ignoredDirectories = { '.git', 'node_modules' },
    },
  },
})

vim.call('ddu#custom#patch_local', 'whole-files', {
  sources = { 'file_rec' },
  sourceParams = {
    file_rec = {
      ignoredDirectories = {},
    },
  },
  sourceOptions = {
    file_rec = {
      maxItems = 10000,
    },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'ddu-ff',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'e', ':call ddu#ui#do_action("itemAction", { "name": "open" })<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':call ddu#ui#do_action("quit")<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'i', ':call ddu#ui#do_action("openFilterWindow")<CR>', { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_user_command('DduNodeFiles', function()
  vim.call('ddu#start', {
    name = 'node-files',
    sourceOptions = { file_rec = { path = vim.fn.getcwd() } },
  })
end, {})

vim.api.nvim_create_user_command('DduWholeFiles', function()
  vim.call('ddu#start', {
    name = 'whole-files',
    sourceOptions = { file_rec = { path = vim.fn.getcwd() } },
  })
end, {})
