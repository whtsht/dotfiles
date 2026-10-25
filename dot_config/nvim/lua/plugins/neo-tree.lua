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
        window = {
          width = 30
        },
      })
      vim.keymap.set(
        "n", "<leader>ef", "<Cmd>Neotree toggle<CR>",
        { silent = true, noremap = true, desc = "Toggle neo-tree" }
      )
      vim.api.nvim_create_autocmd("User", {
        pattern = { "NeogitStatusRefreshed", "NeogitCommitComplete" },
        callback = function()
          if package.loaded["neo-tree"] then
            local events = require("neo-tree.events")
            events.fire_event(events.GIT_EVENT)
          end
        end,
      })
    end
  }
}
