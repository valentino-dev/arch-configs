return {
  {
    'williamboman/mason.nvim', -- language installation
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim', -- mason bridge to lspconfig
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'clangd', 'pyright', 'texlab' }
      })
    end
  },
  {
    'neovim/nvim-lspconfig', -- conifguring lsp with installed language
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.pyright.setup({})
      lspconfig.texlab.setup({})
      lspconfig.ast_grep.setup({})
      --lspconfig.clang_format.setup({})
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp', -- cmp bridge to lsp
    config = function()
    end
  },
  {
    'hrsh7th/nvim-cmp', -- cmp (auto complition)
    config = function()
      local cmp = require('cmp')
      local types = require('cmp.types')
      cmp.setup({
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
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end
  },

}
