local function set_keymap(mode, lhs, rhs, desc)
  local desc = desc or ''
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("i", "jj", "<ESC>", "Exit insert mode")
set_keymap("i", "<c-l>", "<right>", "Move right")
set_keymap("i", "<c-h>", "<left>", "Move left")
set_keymap('n', '<leader>w', ':w<CR>', 'Save file')
set_keymap('n', '<leader>qq', ':qa<CR>', 'Quit')
set_keymap("n", "<leader>n", ":noh<cr>", "Clear search highlight")
set_keymap("n", "<leader>ys", '/<C-r>"<cr>', "Search yanked text")
set_keymap("n", "<leader>yp", ':YankFilePath<cr>', "Yank file path")
set_keymap("n", "<leader>yn", ':YankFileName<cr>', "Yank file name")
set_keymap('n', '<leader>c', '<C-^>', 'Switch to previous file')
set_keymap('n', 'j', 'gj', 'Move down visual line')
set_keymap('n', 'k', 'gk', 'Move up visual line')
set_keymap('n', 'H', '^', 'Move to start of line')
set_keymap('n', 'L', '$', 'Move to end of line')

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

set_keymap('n', '<leader>ff', "<cmd>DduNodeFiles<cr>", 'Telescope find files')

-- Flash
set_keymap("n", "<leader>/", '<cmd>lua require("flash").jump()<cr>', "Search Modes")

-- -- Lsp
-- set_keymap('n', '<M-o>', ':Lspsaga show_line_diagnostics<CR>', 'Open diagnostics')
-- set_keymap('n', '<M-p>', ':Lspsaga diagnostic_jump_prev<CR>', 'Go to previous diagnostic')
-- set_keymap('n', '<M-n>', ':Lspsaga diagnostic_jump_next<CR>', 'Go to next diagnostic')
-- set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', 'Show hover')
-- set_keymap('n', 'gd', ':Lspsaga goto_definition<CR>', 'Go to definition')
-- set_keymap('n', 'gt', ':Lspsaga goto_type_definition<CR>', 'Go to type definition')
-- set_keymap('n', 'gf', ':Lspsaga finder<CR>', 'Find references')
-- set_keymap('n', '<M-f>', ':lua vim.lsp.buf.format()<CR>', 'Format document')
-- set_keymap('n', '<M-r>', ':Lspsaga rename<CR>', 'Rename')
-- set_keymap('n', '<M-a>', ':Lspsaga code_action<CR>', 'Code action')
