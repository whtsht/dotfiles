local options = {
  opt = {
    -- backup and history
    writebackup = false,
    swapfile = false,
    undofile = true,

    -- display
    number = true,
    relativenumber = true,
    list = true,
    listchars = {
      eol = "↵",
      space = "·",
      tab = "|·",
      trail = "~",
      extends = ">",
      precedes = "<",
    },
    background = "dark",
    spelllang = "en,cjk",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    winblend = 0,
    pumblend = 0,
    shortmess = "I",
    wrap = true,
  },
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
