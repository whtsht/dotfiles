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
    vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>",
      { desc = "Stage git hunk", silent = true }
    )
    vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>",
      { desc = "Undo stage git hunk", silent = true }
    )
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>",
      { desc = "Reset git hunk", silent = true }
    )
  end,
}
