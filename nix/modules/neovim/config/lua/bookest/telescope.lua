require('telescope').setup()

local opts = { silent = true }

vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)
