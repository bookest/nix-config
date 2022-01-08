-- home-manager generates an init.vim, so we source this file on startup

vim.g.mapleader = ' '

vim.g.autoindent = true
vim.g.expandtab = true
vim.g.hidden = true
vim.g.signcolumn = true
vim.g.smartindent = true
vim.g.spell = true
vim.g.spelllang = "en_us"
vim.g.termguicolors = true
vim.g.undodir = vim.fn.expand("~/.config/nvim/undo")
vim.g.undofile = true
vim.g.updatetime = 500

vim.o.expandtab = true
vim.o.scrolloff = 7

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd [[colorscheme gruvbox]]
vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

require("gitsigns").setup {
  signs = {
    add = {h1 = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change = {h1 = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete = {h1 = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete = {h1 = 'GitSignsAdd', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {h1 = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = true,
  },
}

require('telescope').setup()
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true, silent = true})
