return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        filesystem = {
          use_libuv_file_watcher = true
        },
      })
      vim.keymap.set(
        "n", "<leader>ef", "<Cmd>Neotree toggle<CR>",
        { silent = true, noremap = true, desc = "Toggle neo-tree" }
      )
    end
  }
}
