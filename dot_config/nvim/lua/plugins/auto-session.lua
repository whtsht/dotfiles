return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    {
      "<leader>ws",
      function()
        vim.ui.input({ prompt = "Session name: " }, function(name)
          if name and name ~= "" then
            vim.cmd("AutoSession save " .. name)
          end
        end)
      end,
      desc = "Save session",
    },
  },
  config = function()
    require("auto-session").setup({
      session_lens = {
        picker = "telescope",
        load_on_setup = true
      },
    })
  end
}
