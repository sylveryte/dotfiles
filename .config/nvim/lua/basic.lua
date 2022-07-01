-- vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
vim.opt.termguicolors = true

local trouble = require('trouble')
require('telescope').setup {
   matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
  extensions = {
     fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  defaults = {
    layout_strategy = 'flex',
    layout_config = { height = 0.95, width = 0.95 },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension'repo'
require('telescope').load_extension'dap'

require('nvim-autopairs').setup{}

-- require('mini').setup{}

require 'nvim-tree-config'

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
require("color-picker").setup()

