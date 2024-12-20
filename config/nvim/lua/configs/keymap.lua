local function set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc or "" }
  vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("i", "jj", "<ESC>", "Exit insert mode")
set_keymap("i", "kk", "<ESC>", "Exit insert mode")
set_keymap("i", "<c-l>", "<right>", "Move right")
set_keymap("i", "<c-h>", "<left>", "Move left")
set_keymap("n", "<leader>w", ":w<CR>", "Save file")
set_keymap("n", "<leader>qq", ":qa<CR>", "Quit")
set_keymap("n", "<leader>n", ":noh<cr>", "Clear search highlight")
set_keymap("n", "<leader>ys", '/<C-r>"<cr>', "Search yanked text")
set_keymap("n", "<leader>yp", ":YankFilePath<cr>", "Yank file path")
set_keymap("n", "<leader>yn", ":YankFileName<cr>", "Yank file name")
set_keymap("n", "<leader>c", "<C-^>", "Switch to previous file")
set_keymap("n", "j", "gj", "Move down visual line")
set_keymap("n", "k", "gk", "Move up visual line")
set_keymap("n", "H", "^", "Move to start of line")
set_keymap("n", "L", "$", "Move to end of line")

set_keymap("x", "<leader>s", "y/\\V<C-R>=escape(@\", '/\\')<CR><CR>", "Search selected text")
for _, quote in ipairs({ '"', "'", "`" }) do
  set_keymap({ "x", "o" }, "a" .. quote, "2i" .. quote, "Select inside " .. quote)
end
set_keymap("t", "<esc>", "<c-\\><c-n>", "Exit insert mode")

-- Copilot
set_keymap("i", "<c-i>", "<cmd>lua require('copilot.suggestion').accept_line()<cr>")
set_keymap("i", "<c-l>", "<cmd>lua require('copilot.suggestion').dismiss()<cr>")

-- FzfLua
set_keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>")
set_keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
set_keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")
set_keymap("n", "<leader>fc", "<cmd>FzfLua command_history<cr>")
set_keymap("n", "<leader>fg", "<cmd>FzfLua git_files<cr>")
set_keymap("n", "<leader>ft", "<cmd>FzfLua git_branches<cr>")
set_keymap("n", "<leader>fl", "<cmd>FzfLua live_grep_native<cr>")

-- Luasnip
set_keymap(
  "i",
  "<Tab>",
  "<cmd>lua require('luasnip').expand_or_jump()<cr>",
  "Expand or jump snippet"
)
set_keymap("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", "Jump to previous snippet")
set_keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<cr>", "Jump to next snippet")
set_keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<cr>", "Jump to previous snippet")
set_keymap(
  "i",
  "<c-e>",
  "<cmd>lua require('luasnip').choice_active() and '<Plug>luasnip-next-choice' or '<c-e>'<cr>",
  "Change choice"
)
set_keymap(
  "s",
  "<c-e>",
  "<cmd>lua require('luasnip').choice_active() and '<Plug>luasnip-next-choice' or '<c-e>'<cr>",
  "Change choice"
)

-- Lspsaga
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
set_keymap("n", "gf", ":Lspsaga lsp_finder<CR>", "Find references")
set_keymap("n", "gr", ":Lspsaga rename<CR>", "Rename")
set_keymap("n", "ga", ":Lspsaga code_action<CR>", "Code action")
set_keymap("n", "gf", ":lua vim.lsp.buf.format()<CR>", "Format document (no Lspsaga equivalent)")
