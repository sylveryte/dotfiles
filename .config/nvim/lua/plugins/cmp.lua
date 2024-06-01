local cmp = require 'cmp'
local luasnip = require("luasnip")

require "lsp_signature".setup({})
require "lsp_signature".on_attach({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "single"
  }
})


require("luasnip.loaders.from_lua").lazy_load({ paths = { "./lua/luasnippets" } })

cmp.setup({
  preselect = cmp.PreselectMode.Item,
  view = {
    entries = "custom"
  },
  -- snippet = {
  --   expand = function(args)
  --     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --   end,
  -- },
  formatting = {
    -- is in lspkind
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    -- ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    -- ["<C-y>"] = cmp.mapping(
    --   cmp.mapping.confirm {
    --     behavior = cmp.ConfirmBehavior.Insert,
    --     select = true,
    --   },
    --   { "i", "c" }
    -- ),
    -- ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }, { "i", "c" }
    -- ), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-q>'] = cmp.mapping.abort(),


    -- luasnip mappings
    ['<C-e>'] = cmp.mapping(function(fallback)
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({
            select = true,
          })
        end
      else
        fallback()
      end
    end),

    ["<A-j>"] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),


    ["<A-k>"] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  sources = cmp.config.sources({
    { name = 'neorg' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp_signature_help' },
    { name = 'cmp-tw2css' },
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' },
    { name = 'path' }
  })
})

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
