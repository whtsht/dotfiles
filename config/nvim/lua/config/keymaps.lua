local lazyterm = function()
  local Util = require("lazyvim.util")
  Util.terminal(nil, {
    cwd = Util.root(),
    border = "rounded",
    size = { width = 0.9, height = 0.9 },
  })
end

local keymaps = {
  n = {
    { "<leader>p", "<C-^>", { noremap = true, silent = true } },
    { "<leader>n", ":noh<CR>", { noremap = true, silent = true } },
    { "<leader>w", ":w<CR>", { noremap = true, silent = true } },
    { "<leader>q", ":q<CR>", { noremap = true, silent = true } },
    { "<leader>.", "@@", { noremap = true, silent = true }, desc = "Repeat the previous macro" },
    { "<leader>y", '/<C-r>"<CR>', { noremap = true, silent = true, desc = "Search yanked text" } },

    { "<C-/>", lazyterm, { noremap = true, silent = true, desc = "Open Nth Terminal" } },
    { "<C-p>", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true } },
    { "<leader>e", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true } },
    { "<leader>r", "<cmd>Telescope resume<cr>", { noremap = true, silent = true, desc = "Resume" } },
  },
  i = {
    { "kk", "<Esc>", { noremap = true } },
    { "jj", "<Esc>", { noremap = true } },

    { "<C-l>", "<Right>", { noremap = true } },
    { "<C-h>", "<Left>", { noremap = true } },
  },
  t = {
    { "<C-l>", "<C-l>", { noremap = true } },
    { "<C-h>", "<C-h>", { noremap = true } },
    { "<C-j>", "<C-j>", { noremap = true } },
    { "<C-k>", "<C-k>", { noremap = true } },

    { "<C-[>", "<C-\\><C-n>", { noremap = true } },
  },
}

-- avoid removing outer spaces
for _, quote in ipairs({ '"', "'", "`" }) do
  vim.keymap.set({ "x", "o" }, "a" .. quote, "2i" .. quote)
end

for mode, args_list in pairs(keymaps) do
  for _, args in ipairs(args_list) do
    local key, action, options = unpack(args)
    vim.keymap.set(mode, key, action, options)
  end
end
