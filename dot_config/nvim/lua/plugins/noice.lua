return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = not vim.g.neovide,
  opts = {
    messages = {
      enabled = false
    },
    notify = {
      enabled = false
    }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
