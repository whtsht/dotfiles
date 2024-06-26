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
      local function currentDir()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
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
          lualine_a = { 'mode' },
          lualine_b = { 'diagnostics' },
          lualine_c = { currentDir, { 'filename', path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { '' }
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

  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection

      local function hintChar1(direction, current_line_only, hint_offset)
        hop.hint_char1({
          direction = direction,
          current_line_only = current_line_only,
          hint_offset = hint_offset
        })
      end

      vim.keymap.set('', 'f', function()
        hintChar1(directions.AFTER_CURSOR, true, nil)
      end, { remap = true })

      vim.keymap.set('', 'F', function()
        hintChar1(directions.BEFORE_CURSOR, true, nil)
      end, { remap = true })

      vim.keymap.set('', 't', function()
        hintChar1(directions.AFTER_CURSOR, true, -1)
      end, { remap = true })

      vim.keymap.set('', 'T', function()
        hintChar1(directions.BEFORE_CURSOR, true, 1)
      end, { remap = true })
    end
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
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({
        performance = {
          max_view_entries = 15,
        },
      })
    end
  },
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
      require("no-neck-pain").setup({
        width = 120,
      })
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
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        top_down = false,
        timeout = 2000,
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      local function create_filter(event, kind, find)
        return {
          filter = {
            event = event,
            kind = kind,
            find = find,
          },
          opts = { skip = true },
        }
      end
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
        messages = {
          view_search = "notify",
        },
        routes = {
          create_filter("msg_show", "", "written"),
          create_filter("msg_show", "", "lines"),
          create_filter("msg_show", "", "line"),
          create_filter("msg_show", "", "change"),
          create_filter("msg_show", "", "continuing"),
          create_filter("msg_show", "search_count", ""),
        },
      })
    end
  },

  -- A neovim lua plugin to help easily manage multiple terminal windows
  {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup {
          direction = "float",
          float_opts = {
            border = "single",
            width = 120,
            height = 30,
          },
        }
      end
    }
  },

  -- SKK
  {
    "vim-skk/skkeleton",
    config = function()
      vim.fn["skkeleton#config"] {
        globalDictionaries = {
          vim.fn.expand("~") .. "/.skk/SKK-JISYO.L"
        }
      }
    end,
    dependencies = { "vim-denops/denops.vim" }
  },
  {
    "rinx/cmp-skkeleton",
    dependencies = { "vim-skk/skkeleton", "hrsh7th/nvim-cmp" }
  },

  -- zoxide integration
  {
    "jvgrootveld/telescope-zoxide",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("zoxide")
      vim.keymap.set("n", "<leader>z", telescope.extensions.zoxide.list)
    end
  }
}

local LazySetup = require("user.lazy_setup")
LazySetup(plugins)
