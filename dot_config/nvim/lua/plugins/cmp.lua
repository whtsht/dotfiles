return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "rinx/cmp-skkeleton",
    'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    local cmp = require("cmp")
    local compare = cmp.config.compare

    -- Keep skkeleton candidates in the order skkeleton returns them
    -- (same as its henkan order) instead of cmp's length/recency sorting.
    local function skkeleton_order(entry1, entry2)
      if entry1.source.name == "skkeleton" and entry2.source.name == "skkeleton" then
        return entry1.id < entry2.id
      end
    end

    cmp.setup({
      sorting = {
        comparators = {
          skkeleton_order,
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.locality,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      },
      snippet = {
        expand = function(args)
          require 'luasnip'.lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-y>"] = cmp.mapping.complete(),
        ["<C-k>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "skkeleton" },
        { name = 'luasnip' }
      }, {
        { name = "buffer" },
      }),
    })

    -- nvim-cmp auto-triggers only when the cursor advances by exactly one byte,
    -- so multibyte kana inserted by skkeleton never starts completion.
    vim.api.nvim_create_autocmd("User", {
      pattern = "skkeleton-handled",
      callback = function()
        if vim.fn.mode() ~= "i" then
          return
        end
        local state = vim.g["skkeleton#state"]
        if state and state.phase == "input:okurinasi" then
          cmp.complete()
        end
      end,
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
