require('nvim-treesitter').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- Enable highlighting for SAFETY comments
vim.api.nvim_set_hl(0, '@comment.safety', { link = '@comment.warning' })

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
