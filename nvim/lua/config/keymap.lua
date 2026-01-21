local function set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc or "" }
  vim.keymap.set(mode, lhs, rhs, opts)
end


set_keymap("i", "jj", "<ESC>", "Exit insert mode")
set_keymap("n", "<C-s>", ":w<CR>", "Save the file")
vim.keymap.set('i', '<C-s>', function()
  vim.cmd('silent! write')
end, { desc = 'Save the file' })
set_keymap("n", '<C-w><C-w>', '<cmd>qa<CR>', 'Quit all windows')
set_keymap("n", "<leader>n", ":noh<CR>", "Clear search highlight")
set_keymap("n", "<leader>c", "<C-^>", "Switch to previous file")
set_keymap("n", "j", "gj", "Move down visual line")
set_keymap("n", "k", "gk", "Move up visual line")
set_keymap("n", "H", "^", "Move to start of line")
set_keymap("n", "L", "$", "Move to end of line")
set_keymap("n", "<leader>v", ":vsplit<CR>", "Split vertically")
set_keymap("n", "<leader>s", ":split<CR>", "Split horizontally")
set_keymap("n", "<leader>yl", function()
  local filename = vim.fn.expand("%:.")
  local line_number = vim.fn.line(".")
  local result = filename .. ":" .. line_number
  vim.fn.setreg("+", result)
  vim.notify("Copied: " .. result)
end, "Copy filename:line_number to clipboard")


-- LSP
set_keymap("n", "go", ":Lspsaga show_line_diagnostics<CR>", "Open diagnostics")
set_keymap("n", "gp", ":Lspsaga diagnostic_jump_prev<CR>", "Go to previous diagnostic")
set_keymap("n", "gn", ":Lspsaga diagnostic_jump_next<CR>", "Go to next diagnostic")
set_keymap("n", "gk", ":Lspsaga hover_doc<CR>", "Show hover")
set_keymap("n", "gd", ":Lspsaga goto_definition<CR>", "Go to definition")
set_keymap(
  "n",
  "gt",
  ":Lspsaga goto_type_definition<CR>",
  "Go to type definition (no Lspsaga equivalent)"
)
set_keymap("n", "gi", ":Lspsaga finder<CR>", "Find references")
set_keymap("n", "gr", ":Lspsaga rename<CR>", "Rename")
set_keymap("n", "ga", ":Lspsaga code_action<CR>", "Code action")
set_keymap("n", "gf", ":lua vim.lsp.buf.format()<CR>", "Format document (no Lspsaga equivalent)")
