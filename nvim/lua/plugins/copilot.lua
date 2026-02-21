return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp"
  },
  config = function()
    require("copilot").setup({
      should_attach = function(bufnr)
        -- Only attach to buffers with a filename that doesn't start with a dot
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
        return not filename:match("^%.")
      end,
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
