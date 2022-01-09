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

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('v', '<leader>ss', [[:sort<CR>]], opts)

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
vim.api.nvim_set_keymap('n', '<C-p>', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fg', [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)

local lspconfig = require('lspconfig')
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fs', [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', [[<Cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', [[<Cmd>lua vim.diagnostic.goto_prev()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', [[<Cmd>lua vim.diagnostic.goto_next()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', [[<Cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', [[<Cmd>lua vim.lsp.buf.references()<CR>]], opts)
end

local servers = { 'bashls', 'gopls', 'pyright', 'rnix', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
