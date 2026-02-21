return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")
    telescope.setup {
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-e>"] = lga_actions.to_fuzzy_refine,
            },
          },
        }
      }
    }
    telescope.load_extension('fzf')
    telescope.load_extension("live_grep_args")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fl', telescope.extensions.live_grep_args.live_grep_args,
      { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>ft', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fb', builtin.git_branches, { desc = 'Telescope switch git branches' })
  end
}
