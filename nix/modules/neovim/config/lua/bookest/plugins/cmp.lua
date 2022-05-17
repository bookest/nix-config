local cmp = require 'cmp'
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '[Buffer]',
        luasnip = '[LuaSnip]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['C-p'] = cmp.mapping.select_prev_item(),
    ['C-n'] = cmp.mapping.select_next_item(),
    ['<CR>'] = cmp.mapping.confirm {
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'spell' },
    { name = 'buffer' },
  },
}
