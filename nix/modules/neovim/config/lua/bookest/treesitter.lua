require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = { 'lua', 'kotlin', 'nix' },
  },
}
