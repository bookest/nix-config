local on_attach = function(_, bufnr)
  local opts = { silent = true, buffer = bufnr }
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump { count = -1, float = true }
  end, opts)
  vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump { count = 1, float = true }
  end, opts)
  vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  'asm_lsp',
  'bashls',
  'clangd',
  'eslint',
  'gopls',
  'hls',
  'kotlin_language_server',
  'lua_ls',
  'pyright',
  'rust_analyzer',
  'ts_ls',
  'zls',
}
for _, server in ipairs(servers) do
  require('bookest.lsp.servers.' .. server).setup(on_attach, capabilities)
end

require('fidget').setup {}
