local M = {}

M.setup = function(on_attach, capabilities)
  require('lspconfig').rnix.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M
