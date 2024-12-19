local options = {
	opt = {
		-- backup and history
		writebackup = false,
		swapfile = false,
		undofile = true,

		clipboard = "unnamedplus",

		expandtab = true,
		shiftwidth = 2,
		tabstop = 2,
		softtabstop = 2,

		-- display
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
		spell = false,
		spelllang = "en,cjk",
		splitbelow = true,
		splitright = true,
		termguicolors = true,
		winblend = 0,
		pumblend = 0,
		shortmess = "I",
		wrap = true,
		keywordprg = ":help",
	},
	g = {
		mapleader = " ",
	},
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end

vim.cmd("colorscheme tokyonight-night")
