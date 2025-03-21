require("avante").setup({
  provider = "copilot",
  auto_suggestions_provider = "copilot",
  build = ":AvanteBuild source=false",
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true,
  },
  windows = {
    position = "right",
    wrap = true,
    width = 30,
  },
})
