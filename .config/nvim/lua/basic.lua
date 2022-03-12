require 'nvim-tree-config'
require('telescope').setup {
  extensions = {
  },
  defaults = {
    -- layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.95 },
  },
}
-- require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension'repo'

require('nvim-autopairs').setup{}

