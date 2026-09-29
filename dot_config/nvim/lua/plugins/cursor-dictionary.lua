return {
  "whtsht/cursor-dictionary.nvim",
  config = function()
    require("cursor-dictionary").setup({
      dict = {
        source = vim.fn.expand(" ~/.skk/SKK-JISYO.L"),
        dir = vim.fn.expand("~/.local/share/nvim/cursor-dictionary/"),
        format = "eijiro",
      },
      enabled = false,
    })
  end
}
