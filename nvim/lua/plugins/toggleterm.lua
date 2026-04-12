return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    persist_mode = true,
    direction = 'float',
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    local toggle = function()
      vim.cmd('ToggleTerm')
    end

    vim.keymap.set({ 'n', 'i' }, '<C-/>', toggle, { desc = 'Toggle terminal' })
    vim.keymap.set({ 'n', 'i' }, '<C-_>', toggle, { desc = 'Toggle terminal' })
    vim.keymap.set('t', '<C-/>', toggle, { desc = 'Toggle terminal' })
    vim.keymap.set('t', '<C-_>', toggle, { desc = 'Toggle terminal' })
  end,
}
