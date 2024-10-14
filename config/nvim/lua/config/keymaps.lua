local function set_keymap(mode, lhs, rhs, desc)
  local desc = desc or ''
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("i", "jj", "<ESC>", "Exit insert mode")
set_keymap("i", "kk", "<ESC>", "Exit insert mode")
set_keymap("i", "<c-l>", "<right>", "Exit insert mode")
set_keymap("i", "<c-h>", "<left>", "Exit insert mode")
set_keymap('n', '<leader>w', ':w<CR>', 'Save file')
set_keymap('n', '<leader>q', ':confirm wq<CR>', 'Quit with confirmation')
set_keymap('n', '<leader>d', ':confirm bw<CR>', 'Close buffer with confirmation')
set_keymap("n", "<leader>n", "<cmd>noh<cr>", "Clear search highlight")
set_keymap("n", "<leader>y", '/<C-r>"<cr>', "Search yanked text")
set_keymap('n', '<c-i>', "<cmd>vsplit<cr>", "Vertical window split")
set_keymap('n', '<c-l>', "<cmd>wincmd l<cr>", "Move to right window")
set_keymap('n', '<c-h>', "<cmd>wincmd h<cr>", "Move to left window")
set_keymap('n', '<leader>c', '<C-^>', 'Switch to previous file')
set_keymap(
  "x",
  "<leader>s",
  "y/\\V<C-R>=escape(@\", \'/\\')<CR><CR>",
  "Search selected text"
)
for _, quote in ipairs({ '"', "'", "`" }) do
  set_keymap({ "x", "o" }, "a" .. quote, "2i" .. quote, 'Select inside ' .. quote)
end
set_keymap("t", "<esc>", "<c-\\><c-n>", "Exit insert mode") 

set_keymap(
  { "n", "x", "o" },
  '<leader><leader>',
  function() require("flash").jump() end,
  'Flash'
)
set_keymap(
  { "n", "x", "o" },
  '<leader>s',
  function() require("flash").treesitter() end,
  'Flash Treesitter'
)

set_keymap('n', '<leader>f', "<cmd>Telescope find_files<cr>", 'Telescope find files')
set_keymap('n', '<leader>b', "<cmd>Telescope buffers<cr>", 'Telescope buffers')
set_keymap('n', '<leader>h', "<cmd>Telescope help_tags<cr>", 'Telescope help tags')
set_keymap('n', '<leader>r', "<cmd>Telescope resume<cr>", 'Telescope resume')
set_keymap('n', '<leader>z', "<cmd>Telescope zoxide list<cr>", 'Telescope resume')
set_keymap('n', '<leader>p', "<cmd>Telescope registers<cr>", 'Telescope resume')
set_keymap('n', '<leader>g', "<cmd>Telescope live_grep<cr>", 'Telescope live grep')
set_keymap("n", "<leader>a", "<cmd>Telescope live_grep_args<cr>", "Live grep with args")
set_keymap("n", "<leader>i", "<cmd>Telescope notify<cr>", "Show notifications")

set_keymap("n", "<leader>t", "<cmd>ToggleLazyGit<cr>", "Toggle LazyGit")

set_keymap("n", "<leader>l", "<cmd>Lazy sync<cr>", "Lazy sync")

set_keymap('n', '<leader>ee', "<cmd>silent Yazi cwd<cr>", "Open yazi in working directory")
set_keymap('n', '<leader>ej', "<cmd>silent Yazi<cr>", 'Open yazi at the current file')
