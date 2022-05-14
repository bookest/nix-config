require('telescope').load_extension 'harpoon'

local opts = { silent = true }
vim.keymap.set('n', '<leader>mm', require('telescope').extensions.harpoon.marks, opts)
vim.keymap.set('n', '<leader>mf', require('harpoon.mark').add_file, opts)
vim.keymap.set('n', '<leader>mn', require('harpoon.ui').nav_next, opts)
vim.keymap.set('n', '<leader>mp', require('harpoon.ui').nav_prev, opts)
vim.keymap.set('n', '<leader>mq', require('harpoon.ui').toggle_quick_menu, opts)
