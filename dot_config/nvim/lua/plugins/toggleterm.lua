return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    persist_mode = true,
    direction = 'float',
    shell = 'zsh'
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

    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _lazygit_toggle()
      lazygit:toggle()
    end
    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
  end,
}
