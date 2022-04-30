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

vim.keymap.set('v', '<leader>ss', [[:sort<CR>]], { silent = true })

require 'bookest.gitsigns'
require 'bookest.telescope'
require 'bookest.lsp'
require 'bookest.cmp'
require 'bookest.lualine'
require 'bookest.treesitter'
