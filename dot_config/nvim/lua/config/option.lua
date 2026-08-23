local options = {
  opt = {
    writebackup = false,
    swapfile = false,
    undofile = true,
    clipboard = "unnamedplus",
    expandtab = true,
    shiftwidth = 2,
    tabstop = 2,
    softtabstop = 2,
    number = true,
    relativenumber = true,
    list = true,
    listchars = {
      trail = "~",
      extends = ">",
      precedes = "<",
      space = ".",
      tab = "»-",
      eol = "↲",
    },
    background = "dark",
    spell = true,
    spelllang = "en,cjk",
    spellfile = vim.fn.expand("~/.vim/spell/en.utf-8.add"),
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    winblend = 0,
    pumblend = 0,
    shortmess = "I",
    wrap = true,
    keywordprg = ":help",
    laststatus = 3
  },
  g = {
    mapleader = " ",
  }
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

vim.filetype.add({
  filename = {
    gitconfig = "gitconfig",
    zshrc     = "zsh"
  }
})
