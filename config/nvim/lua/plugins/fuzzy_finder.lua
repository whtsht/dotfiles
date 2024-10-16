return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- extensions
    'jvgrootveld/telescope-zoxide',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    'nvim-telescope/telescope-live-grep-args.nvim'
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-k>"] = require("telescope.actions").close,
        },
        n = {
          ["<C-k>"] = require("telescope.actions").close,
        },
      },
      file_ignore_patterns = {
        "^.git/",
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "-uu",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    }
  }
}
