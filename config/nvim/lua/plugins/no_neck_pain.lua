return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("no-neck-pain").setup({
      width = 100,
    })
    vim.cmd("NoNeckPain")
  end,
}
