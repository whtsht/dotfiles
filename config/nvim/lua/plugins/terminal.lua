return {
  "akinsho/nvim-toggleterm.lua",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-t>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = 130,
        height = 33,
        winblend = 15,
        title_pos = 'center' 
      },
    })
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
    })

    vim.api.nvim_create_user_command("ToggleLazyGit", function()
      lazygit:toggle()
    end, { nargs = 0 })
  end,
}
