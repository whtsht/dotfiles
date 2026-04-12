return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>",
      { desc = "Go to next git hunk", silent = true }
    )
    vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<CR>",
      { desc = "Go to previous git hunk", silent = true }
    )
    vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>",
      { desc = "Preview git hunk inline", silent = true }
    )
  end,
}
