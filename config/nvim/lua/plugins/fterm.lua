return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "single",
      dimensions = {
        height = 0.85,
        width = 0.8,
      },
    })
  end,
}
