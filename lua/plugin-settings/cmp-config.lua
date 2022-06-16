local cmp = require 'cmp'

cmp.setup {
  -- load vsnip
  snippet = {
    expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
    end
  },
  -- define mappings for completion
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<Down>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
    ['<Up>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()--{behavior = cmp.SelectBehavior.Select, select = true})
      else
        fallback()
      end
    end,
   },
  -- add ons for cmp
  -- https://github.com/topics/nvim-cmp
  -- put the sources in preferred order
  sources = cmp.config.sources({
    { name = 'buffer', option = {max_item_count = 5, keyword_length = 6}},
    { name = 'vsnip'},
    { name = 'nvim_lsp'},
    { name = 'latex_symbols'},
    { name = 'calc'},
    {name = 'spell'}
  }),

  formatting = {
    format = require("lspkind").cmp_format({with_text = true, menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[Lsp]",
        latex_symbols = "[Tex]",
        vsnip = "[Vsnip]"
     })
   }),
  },
}

