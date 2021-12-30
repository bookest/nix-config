-- home-manager generates an init.vim, so we source this file on startup

vim.o.scrolloff = 7
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd 'colorscheme gruvbox'
