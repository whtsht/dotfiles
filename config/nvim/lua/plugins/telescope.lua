return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-[>"] = require("telescope.actions").close,
        },
      },
    },
  },
}
