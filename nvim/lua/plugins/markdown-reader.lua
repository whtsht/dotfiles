return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    render_modes = true,
    anti_conceal = {
      enabled = true,
      ignore = {
        bullet = { 'n' },
        callout = { 'n' },
        check_icon = { 'n' },
        check_scope = { 'n' },
        code_background = { 'n' },
        code_border = { 'n' },
        code_language = { 'n' },
        dash = { 'n' },
        head_background = { 'n' },
        head_border = { 'n' },
        head_icon = { 'n' },
        indent = { 'n' },
        latex = { 'n' },
        link = { 'n' },
        quote = { 'n' },
        sign = { 'n' },
        table_border = { 'n' },
        virtual_lines = { 'n' },
      },
    },
    win_options = {
      conceallevel = { rendered = 3 },
      concealcursor = { rendered = 'nc' },
    },
    code = {
      conceal_delimiters = true,
      border = 'thin',
    },
  }
}
