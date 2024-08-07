return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").close,
        },
        n = {
          ["<C-k>"] = require("telescope.actions").close,
        },
      },
    },
  },
}
