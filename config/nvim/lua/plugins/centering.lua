return {
  "shortcuts/no-neck-pain.nvim",
  config = function()
    require("no-neck-pain").setup()
    vim.cmd("NoNeckPain")
  end,
}