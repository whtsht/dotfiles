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
set_keymap("n", "<leader>n", ":noh<cr>", "Clear search highlight")
set_keymap("n", "<leader>ys", '/<C-r>"<cr>', "Search yanked text")
set_keymap("n", "<leader>yp", ':CopyFilePath<cr>', "Yank file path")
set_keymap("n", "<leader>yn", ':CopyFileName<cr>', "Yank file name")
set_keymap('n', '<c-i>', ":vsplit<cr>", "Vertical window split")
set_keymap('n', '<c-l>', ":wincmd l<cr>", "Move to right window")
set_keymap('n', '<c-h>', ":wincmd h<cr>", "Move to left window")
set_keymap('n', '<leader>c', '<C-^>', 'Switch to previous file')
set_keymap('n', 'p', 'p`]', 'Paste and re-indent')
set_keymap('n', 'P', 'P`]', 'Paste before and re-indent')

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

-- Flash
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

-- Telescope
set_keymap('n', '<leader>f', ":Telescope find_files<cr>", 'Telescope find files')
set_keymap('n', '<leader>b', ":Telescope buffers<cr>", 'Telescope buffers')
set_keymap('n', '<leader>h', ":Telescope help_tags<cr>", 'Telescope help tags')
set_keymap('n', '<leader>r', ":Telescope resume<cr>", 'Telescope resume')
set_keymap('n', '<leader>z', ":Telescope zoxide list<cr>", 'Telescope resume')
set_keymap('n', '<leader>p', ":Telescope registers<cr>", 'Telescope resume')
set_keymap('n', '<leader>g', ":Telescope live_grep<cr>", 'Telescope live grep')
set_keymap("n", "<leader>a", ":Telescope live_grep_args<cr>", "Live grep with args")
set_keymap("n", "<leader>i", ":Telescope notify<cr>", "Show notifications")

-- Lsp
set_keymap('n', '<M-o>', ':Lspsaga show_line_diagnostics<CR>', 'Open diagnostics')
set_keymap('n', '<M-p>', ':Lspsaga diagnostic_jump_prev<CR>', 'Go to previous diagnostic')
set_keymap('n', '<M-n>', ':Lspsaga diagnostic_jump_next<CR>', 'Go to next diagnostic')
set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', 'Show hover')
set_keymap('n', 'gd', ':Lspsaga goto_definition<CR>', 'Go to definition')
set_keymap('n', 'gt', ':Lspsaga goto_type_definition<CR>', 'Go to type definition')
set_keymap('n', 'gf', ':Lspsaga finder<CR>', 'Find references')
set_keymap('n', '<M-f>', ':lua vim.lsp.buf.format()<CR>', 'Format document')
set_keymap('n', '<M-r>', ':Lspsaga rename<CR>', 'Rename')
set_keymap('n', '<M-a>', ':Lspsaga code_action<CR>', 'Code action')

-- LazyGit
set_keymap("n", "<leader>t", ":ToggleLazyGit<cr>", "Toggle LazyGit")

-- Lazy
set_keymap("n", "<leader>l", ":Lazy sync<cr>", "Lazy sync")

-- Yazi
set_keymap('n', '<leader>ee', ":silent Yazi cwd<cr>", "Open yazi in working directory")
set_keymap('n', '<leader>ej', ":silent Yazi<cr>", 'Open yazi at the current file')
