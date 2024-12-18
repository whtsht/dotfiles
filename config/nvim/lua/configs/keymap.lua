local function set_keymap(mode, lhs, rhs, desc)
  local desc = desc or ''
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("i", "jj", "<ESC>", "Exit insert mode")
set_keymap("i", "kk", "<ESC>", "Exit insert mode")
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

-- FzfLua
set_keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>")
set_keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
set_keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")

set_keymap("n", "<leader>gf", "<cmd>FzfLua git_files<cr>")
set_keymap("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>")
set_keymap("n", "<leader>lg", "<cmd>FzfLua live_grep_native<cr>")

-- Lsp
set_keymap('n', '<M-o>', ':lua vim.diagnostic.open_float()<CR>', 'Open diagnostics')
set_keymap('n', '<M-p>', ':lua vim.diagnostic.goto_prev()<CR>', 'Go to previous diagnostic')
set_keymap('n', '<M-n>', ':lua vim.diagnostic.goto_next()<CR>', 'Go to next diagnostic')
set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', 'Show hover')
set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', 'Go to definition')
set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', 'Go to type definition')
set_keymap('n', 'gf', ':lua vim.lsp.buf.references()<CR>', 'Find references')
set_keymap('n', '<M-f>', ':lua vim.lsp.buf.formatting()<CR>', 'Format document')
set_keymap('n', '<M-r>', ':lua vim.lsp.buf.rename()<CR>', 'Rename')
set_keymap('n', '<M-a>', ':lua vim.lsp.buf.code_action()<CR>', 'Code action')
