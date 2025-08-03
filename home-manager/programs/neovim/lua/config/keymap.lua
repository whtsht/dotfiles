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

-- FzfLua
set_keymap("n", "<leader>fi", "<cmd>FzfLua files<cr>")
set_keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
set_keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")
set_keymap("n", "<leader>fc", "<cmd>FzfLua command_history<cr>")
set_keymap("n", "<leader>ff", "<cmd>FzfLua git_files<cr>")
set_keymap("n", "<leader>ft", "<cmd>FzfLua git_branches<cr>")
set_keymap("n", "<leader>fl", "<cmd>lua require'fzf-lua'.live_grep({ cmd = \"git grep --line-number --column --color=always\" })<cr>")
set_keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>")

-- Neotree
set_keymap("n", "<leader>ef", ":Neotree filesystem<CR>", "Toggle Neotree filesystem")
set_keymap("n", "<leader>eb", ":Neotree buffers<CR>", "Toggle Neotree buffers")
set_keymap("n", "<leader>ec", ":Neotree close<CR>", "Close Neotree")

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

-- ToggleTerm
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "single",
    width = 110,
    height = 32,
  },
})
function _lazygit_toggle()
  lazygit:toggle()
end
set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", "Toggle lazygit in terminal")

local simple_terminal = Terminal:new({
  cmd = "zsh",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "single",
    width = 110,
    height = 32,
  },
})
function _simple_terminal_toggle()
  simple_terminal:toggle()
end
set_keymap("n", "<leader>tt", "<cmd>lua _simple_terminal_toggle()<CR>", "Toggle simple terminal")

local claudecode = Terminal:new({
  cmd = "claude",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "single",
    width = 110,
    height = 32,
  },
})
function _claudecode_toggle()
  claudecode:toggle()
end
set_keymap("n", "<leader>tc", "<cmd>lua _claudecode_toggle()<CR>", "Toggle Claude Code in terminal")
