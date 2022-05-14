local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').kotlin_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M
