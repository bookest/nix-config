require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '-' },
    topdelete = { text = '-' },
    changedelete = { text = '~' },
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 2000,
    ignore_whitespace = true,
  },
  on_attach = function(bufnr)
    local gitsigns = package.loaded.gitsigns
    local opts = { buffer = bufnr }

    vim.keymap.set('n', ']h', gitsigns.next_hunk, opts)
    vim.keymap.set('n', '[h', gitsigns.prev_hunk, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
    vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, opts)
    vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, opts)
    vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, opts)
    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, opts)

    -- Hunk text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
}
