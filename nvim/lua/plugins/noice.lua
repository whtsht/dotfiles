return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = not vim.g.vscode,
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
