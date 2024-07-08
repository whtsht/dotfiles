local lazyterm = function()
  local Util = require("lazyvim.util")
  Util.terminal(nil, {
    cwd = Util.root(),
    border = "rounded",
    size = { width = 0.8, height = 0.8 },
  })
end

local keymaps = {
  n = {
    { "<leader>w", ":w<CR>", { noremap = true, silent = true } },
    { "<leader>p", "<C-^>", { noremap = true, silent = true } },
    { "<leader>n", ":noh<CR>", { noremap = true, silent = true } },

    { "<C-/>", lazyterm, { noremap = true, silent = true, desc = "Terminal (root dir)" } },
  },
  i = {
    { "<C-o>", "<Plug>(skkeleton-enable)", { noremap = true, silent = true } },

    { "<C-l>", "<Right>", { noremap = true } },
    { "<C-h>", "<Left>", { noremap = true } },
    { "<C-j>", "<Down>", { noremap = true } },
    { "<C-k>", "<Up>", { noremap = true } },
  },
  c = {
    { "<C-o>", "<Plug>(skkeleton-enable)", { noremap = true, silent = true } },
  },
  t = {
    -- disable go to window mappings
    { "<C-l>", "<C-l>", { noremap = true } },
    { "<C-h>", "<C-h>", { noremap = true } },
    { "<C-j>", "<C-j>", { noremap = true } },
    { "<C-k>", "<C-k>", { noremap = true } },

    { "<C-[>", "<C-\\><C-n>", { noremap = true } },
  },
}

-- avoid remove outer spaces
for _, quote in ipairs({ '"', "'", "`" }) do
  vim.keymap.set({ "x", "o" }, "a" .. quote, "2i" .. quote)
end

for mode, args_list in pairs(keymaps) do
  for _, args in ipairs(args_list) do
    local key, action, options = unpack(args)
    vim.keymap.set(mode, key, action, options)
  end
end
