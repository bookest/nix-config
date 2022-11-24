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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  'bashls',
  'clangd',
  'eslint',
  'gopls',
  'kotlin_language_server',
  'pyright',
  'rnix',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
}
for _, server in ipairs(servers) do
  require('bookest.lsp.servers.' .. server).setup(on_attach, capabilities)
end

require('fidget').setup {}
