require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = { 'lua', 'nix', 'kotlin' },
  },
}
