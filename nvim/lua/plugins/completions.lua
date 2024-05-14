return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local types = require('cmp.types')
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Tab>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),

          ["<C-j>"] = {
            i = function()
              if cmp.visible() then
                cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
              else
                cmp.complete()
              end
            end,
          },
          ["<C-k>"] = {
            i = function()
              if cmp.visible() then
                cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
              else
                cmp.complete()
              end
            end,
          },
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
