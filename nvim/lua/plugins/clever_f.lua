return {
  'rhysd/clever-f.vim',
  lazy = false,
  init = function()
    vim.api.nvim_set_hl(0, "MyCleverFMark", {
      fg = "#89b4fa",
      bg = "#1e2030",
      bold = true,
      underline = true,
    })
    vim.g.clever_f_mark_char_color = "MyCleverFMark"
  end
}
