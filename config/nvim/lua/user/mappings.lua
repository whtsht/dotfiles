local function apply_kaymaps(keymaps)
    for mode, map_opts in pairs(keymaps) do
        for _, map_opt in ipairs(map_opts) do
            ---@diagnostic disable-next-line: deprecated
            local key, action, options = unpack(map_opt)
            if options == nil then
                options = { noremap = true, silent = true }
            else
                options.noremap = true
                options.silent = true
            end
            vim.keymap.set(mode, key, action, options)
        end
    end
end

local basic_keymaps = {
    n = {
        { "<leader>w", "<cmd>w<cr>" },
        { "<leader>q", "<cmd>q<cr>" },
        { "<leader>n", "<cmd>noh<cr>" },

        { "<leader><leader>", "<cmd>HopPattern<cr>" },

        { "k", "gk" },
        { "j", "gj" },
        { "H", "g^" },
        { "L", "g$" },

        { "<leader>p", "<C-^>" },
        { "<leader>t", "<cmd>lua require('FTerm').toggle()<cr>" },
    },
    c = {
        { "<C-b>", "<left>" },
        { "<C-f>", "<right>" },
        { "<C-a>", "<home>" },
        { "<C-e>", "<end>" },
        { "<C-p>", "<up>" },
        { "<C-n>", "<down>" },
        { "<C-j>", "<Plug>(skkeleton-enable)" },
    },
    i = {
        { "<C-j>", "<Plug>(skkeleton-enable)" },
    },
    t = {
        { "<C-[>", "<ESC>" },
        { "<leader>t", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<cr>" },
    },
    x = {
        { "a'", "2i'" },
        { "a\"", "2i\"" },
        { "a`", "2i`" },
    },
    o = {
        { "a'", "2i'" },
        { "a\"", "2i\"" },
        { "a`", "2i`" },
    }
}

local fzf_keymaps = {
    n = {
        { "<leader>bi", "<cmd>FzfLua buildin<cr>" },

        { "<leader>ff", "<cmd>FzfLua files<cr>" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
        { "<leader>fo", "<cmd>FzfLua oldfiles<cr>" },
        { "<leader>fq", "<cmd>FzfLua quickfix_stack<cr>" },

        { "<leader>lg", "<cmd>FzfLua live_grep_glob<cr>" },
        { "<leader>lr", "<cmd>FzfLua live_grep_resume<cr>" },

        { "<leader>gf", "<cmd>FzfLua git_files<cr>" },
        { "<leader>gs", "<cmd>FzfLua git_status<cr>" },
        { "<leader>gc", "<cmd>FzfLua git_commits<cr>" },
        { "<leader>gb", "<cmd>FzfLua git_branches<cr>" },
        { "<leader>gt", "<cmd>FzfLua git_tags<cr>" },
        { "<leader>ga", "<cmd>FzfLua git_stash<cr>" },
        {
            "<leader>cc",
            function()
                require("neoclip.fzf")()
            end,
        },

        { "<leader>sh", "<cmd>FzfLua search_history<cr>" },
        { "<leader>ch", "<cmd>FzfLua command_history<cr>" },

        { "<leader>z" , ":lua ChangeWorkspace()<cr>" },
    }
}

local lsp_keymaps = {
    n = {
        { "[d",         vim.diagnostic.goto_prev },
        { "]d",         vim.diagnostic.goto_next },
        { "K",          vim.lsp.buf.hover },
        { "gd",         vim.lsp.buf.definition },
        { "<leader>rn", "<cmd>Lspsaga rename<cr>" },
        { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>" },
        {
            "<leader>f",
            function()
                vim.lsp.buf.format({ async = true })
            end,
        },
    },
}

local align_keymaps = {
    x = {
        {
            "aa",
            function()
                require("align").align_to_string({ preview = true, regex = true })
            end,
        },
    },
}

apply_kaymaps(basic_keymaps)
apply_kaymaps(fzf_keymaps)
apply_kaymaps(align_keymaps)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(_)
        apply_kaymaps(lsp_keymaps)
    end,
})
