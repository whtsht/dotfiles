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

    { "<C-p>", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true } },

    { "<C-/>", lazyterm, { noremap = true, silent = true, desc = "Terminal (root dir)" } },
    { "<leader>fF", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
    { "<leader>ff", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
  },
  i = {
    { "<C-j>", "<Plug>(skkeleton-enable)", { noremap = true, silent = true } },

    { "kk", "<Esc>", { noremap = true } },

    { "<C-l>", "<Right>", { noremap = true } },
    { "<C-h>", "<Left>", { noremap = true } },
  },
  c = {
    { "<C-j>", "<Plug>(skkeleton-enable)", { noremap = true, silent = true } },
  },
  t = {
    -- disable go to window mappings
    { "<C-l>", "<C-l>", { noremap = true } },
    { "<C-h>", "<C-h>", { noremap = true } },
    { "<C-j>", "<C-j>", { noremap = true } },
    { "<C-k>", "<C-k>", { noremap = true } },

    { "<C-j>", "<Plug>(skkeleton-enable)", { noremap = true, silent = true } },

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
