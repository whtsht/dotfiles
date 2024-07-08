return {
  "jvgrootveld/telescope-zoxide",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("zoxide")
    vim.keymap.set("n", "<leader>z", telescope.extensions.zoxide.list)
  end,
}
