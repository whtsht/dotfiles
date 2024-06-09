local plugins = {
    -- color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    -- interface for tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    disable = function(_, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                },
            })
        end,
    },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        priority = 1000,
        config = function()
            local function current_dir()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'diagnostics'},
                    lualine_c = { current_dir, { 'filename', path = 1 }},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {''}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    },

    -- indent guide
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
        config = function()
            require("ibl").setup()
        end,
    },

    -- lsp progress messages
    {
        "j-hui/fidget.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("fidget").setup()
        end,
    },

    -- fuzzy finder.
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup()
        end,
    },

    -- Clipboard manager
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { "ibhagwan/fzf-lua" },
        },
        config = function()
            require("neoclip").setup()
        end,
    },

    -- language server
    { "neovim/nvim-lspconfig" },

    -- completion engine
    { "hrsh7th/nvim-cmp" },
    -- completion sources
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-path" },

    -- snippet
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local loader = require("luasnip.loaders.from_vscode")
            loader.lazy_load({ paths = { "./snippets" } })
            loader.lazy_load()
        end,
    },

    -- aligning lines
    { "Vonr/align.nvim" },

    -- auto pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    -- commenting
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end,
    },

    -- better quickfix window
    {
        "kevinhwang91/nvim-bqf",
    },

    -- show git diff markers
    {
        "airblade/vim-gitgutter",
        lazy = false,
    },

    -- idris lsp
    {
        "ShinKage/idris2-nvim",
        dependencies = { "neovim/nvim-lspconfig", "MunifTanjim/nui.nvim" },
    },

    -- coq
    { "whonore/Coqtail" },
    {
        "tomtomjhj/vscoq.nvim",
        config = function()
            require("vscoq").setup()
        end,
    },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        }
    },

    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        lazy = false,
        config = function()
            require("no-neck-pain").setup({})
            vim.cmd("NoNeckPain")
        end,
    },

    -- GitHub Copilot
    {
        "zbirenbaum/copilot.lua",
        lazy = false,
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },

    -- replaces the UI for messages, cmdline and the popupmenu
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
            })
        end
    },

    -- No-nonsense floating terminal plugin for neovim
    {
        "numToStr/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                dimensions = {
                    height = 0.8,
                    width  = 0.6,
                },
            })
        end
    },
}

local lazy_setup = require("user.lazy_setup")
lazy_setup(plugins)
