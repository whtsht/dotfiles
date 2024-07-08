local options = {
	opt = {
		-- basic
		compatible = false,
		encoding = "utf-8",
		fileencoding = "utf-8",
		clipboard = "unnamedplus",
		completeopt = { "menu", "preview", "noselect" },
		timeoutlen = 300,
		ttimeoutlen = 0,
		shell = "zsh",
		updatetime = 200,

		-- backup and history
		writebackup = false,
		swapfile = false,
		undofile = true,

		-- pattern matching
		ignorecase = true,
		smartcase = true,

		-- indenting
		tabstop = 2,
		expandtab = true,
		softtabstop = 2,
		shiftwidth = 2,

		-- display
		number = true,
		relativenumber = true,
		list = true,
		listchars = {
			eol = "↵",
			space = "·",
			tab = "·",
			trail = "~",
			extends = ">",
			precedes = "<",
		},
		background = "dark",
		spell = true,
		spelllang = "en,cjk",
		splitbelow = true,
		splitright = true,
		termguicolors = true,
		winblend = 0,
		pumblend = 0,
		shortmess = "I",
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
