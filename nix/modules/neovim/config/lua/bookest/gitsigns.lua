require('gitsigns').setup {
  signs = {
    add = {
      h1 = 'GitSignsAdd',
      text = '+',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      h1 = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      h1 = 'GitSignsDelete',
      text = '-',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      h1 = 'GitSignsAdd',
      text = '-',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      h1 = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 2000,
    ignore_whitespace = true,
  },
}
