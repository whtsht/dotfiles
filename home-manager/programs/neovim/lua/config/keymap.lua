local function set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc or "" }
  vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("i", "jj", "<ESC>", "Exit insert mode")
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
set_keymap("n", "<leader>r", ":%s/\\r//g<CR>")

-- Skkeleton
set_keymap('i', '<c-j>', '<Plug>(skkeleton-enable)')

-- Quickfix navigation
set_keymap("n", "<leader>j", ":cnext<CR>", "Next quickfix item")
set_keymap("n", "<leader>k", ":cprev<CR>", "Previous quickfix item") 

-- FzfLua
set_keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>")
set_keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
set_keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")
set_keymap("n", "<leader>fc", "<cmd>FzfLua command_history<cr>")
set_keymap("n", "<leader>fg", "<cmd>FzfLua git_files<cr>")
set_keymap("n", "<leader>ft", "<cmd>FzfLua git_branches<cr>")
set_keymap("n", "<leader>fl", "<cmd>lua require'fzf-lua'.live_grep({ cmd = \"git grep --line-number --column --color=always\" })<cr>")
set_keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>")

-- Luasnip
vim.keymap.set("i", "<Tab>", function()
  return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
end, { expr = true, noremap = true, silent = true, desc = "Expand or jump snippet (or Tab)" })
vim.keymap.set("i", "<S-Tab>", function()
  return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
end, { expr = true, noremap = true, silent = true, desc = "Jump to previous snippet (or Shift-Tab)" })

vim.keymap.set("s", "<Tab>", function()
  return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
end, { expr = true, noremap = true, silent = true, desc = "Jump to next snippet" })
vim.keymap.set("s", "<S-Tab>", function()
  return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
end, { expr = true, noremap = true, silent = true, desc = "Jump to previous snippet" })

vim.keymap.set("i", "<C-e>", function()
  return require("luasnip").choice_active() and "<Plug>luasnip-next-choice" or "<C-e>"
end, { expr = true, noremap = true, silent = true, desc = "Change choice" })
vim.keymap.set("s", "<C-e>", function()
  return require("luasnip").choice_active() and "<Plug>luasnip-next-choice" or "<C-e>"
end, { expr = true, noremap = true, silent = true, desc = "Change choice" })

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
set_keymap("n", "gi", ":Lspsaga finder<CR>", "Find references")
set_keymap("n", "gr", ":Lspsaga rename<CR>", "Rename")
set_keymap("n", "ga", ":Lspsaga code_action<CR>", "Code action")
set_keymap("n", "gf", ":lua vim.lsp.buf.format()<CR>", "Format document (no Lspsaga equivalent)")
