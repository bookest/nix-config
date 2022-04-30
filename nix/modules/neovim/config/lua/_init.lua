-- home-manager generates an init.vim, so we source this file on startup

vim.g.mapleader = ' '

vim.g.autoindent = true
vim.g.expandtab = true
vim.g.hidden = true
vim.g.smartindent = true
vim.g.spell = true
vim.g.spelllang = 'en_us'
vim.g.termguicolors = true
vim.g.undodir = vim.fn.expand '~/.config/nvim/undo'
vim.g.undofile = true
vim.g.updatetime = 500

vim.o.expandtab = true
vim.o.scrolloff = 7

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

vim.cmd [[colorscheme gruvbox-material]]
vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

local silent = { silent = true }

vim.keymap.set('v', '<leader>ss', [[:sort<CR>]])

require('gitsigns').setup {
  signs = {
    add = { h1 = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change = { h1 = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete = { h1 = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete = { h1 = 'GitSignsAdd', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { h1 = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 2000,
    ignore_whitespace = true,
  },
}

require('telescope').setup()
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, silent)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, silent)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, silent)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, silent)

local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
  'bashls',
  'clangd',
  'gopls',
  'kotlin_language_server',
  'pyright',
  'rnix',
  'rust_analyzer',
  'tsserver',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

require('fidget').setup {}

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
    { name = 'buffer' },
  },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_seperators = '|',
    section_separators = '',
    globalstatus = true,
  },
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = { 'lua', 'kotlin', 'nix' },
  },
}
