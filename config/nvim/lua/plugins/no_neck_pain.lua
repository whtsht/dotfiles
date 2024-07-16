return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("no-neck-pain").setup({
      width = 120,
    })
    vim.cmd("NoNeckPain")
  end,
}
