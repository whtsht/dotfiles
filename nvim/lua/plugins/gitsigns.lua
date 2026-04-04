return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>",
      { desc = "Go to next git hunk", silent = true }
    )
    vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>",
      { desc = "Go to previous git hunk", silent = true }
    )
  end,
}
