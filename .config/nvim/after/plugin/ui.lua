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

require("nvim-autopairs").setup{}
