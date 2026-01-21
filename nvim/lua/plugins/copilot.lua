return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp"
  },
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 15,
        trigger_on_accept = true,
        keymap = {
          accept = "<C-l>",
          dismiss = "<C-d>",
          accept_word = false,
          accept_line = false,
          -- next = "<M-]>",
          -- prev = "<M-[>",
          toggle_auto_trigger = false,
        },
      }
    })
  end
}
