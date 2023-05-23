vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require('gitsigns').setup()
require('mini.indentscope').setup()
require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = false,
  show_end_of_line = true,
  space_char_blankline = " ",
}

local db = require('dashboard')
db.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticHint',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
  },
})
