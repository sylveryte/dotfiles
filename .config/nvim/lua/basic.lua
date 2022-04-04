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
    -- layout_strategy = 'vertical',
    -- layout_config = { height = 0.95, width = 0.95 },
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension'repo'

require('nvim-autopairs').setup{}

-- require('mini').setup{}

require 'nvim-tree-config'

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
