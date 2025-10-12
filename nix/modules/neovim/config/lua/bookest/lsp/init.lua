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

vim.lsp.config('*', {
  on_attach = on_attach,
  capabilities = capabilities,
})

local servers = {
  { 'asm_lsp' },
  { 'bashls' },
  { 'clangd' },
  { 'eslint' },
  { 'gopls' },
  { 'hls' },
  { 'kotlin_language_server' },
  {
    'lua_ls',
    {
      settings = (function()
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, 'lua/?.lua')
        table.insert(runtime_path, 'lua/?/init.lua')
        return {
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
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        }
      end)(),
    },
  },
  { 'pyright' },
  { 'rust_analyzer' },
  { 'ts_ls' },
  { 'zls' },
}

for _, lsp in pairs(servers) do
  local name, config = lsp[1], lsp[2]
  vim.lsp.enable(name)
  if config then
    vim.lsp.config(name, config)
  end
end

require('fidget').setup {}
