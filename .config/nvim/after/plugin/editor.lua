require('telescope-all-recent').setup({})
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('frecency')
-- require('telescope').load_extension'repo'
-- require('telescope').load_extension'dap'
-- require('telescope').load_extension("ag")

require('todo-comments').setup({})
require('which-key').setup({})

-- config.filesystem.follow_current_file.enabled = true
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
    follow_current_file = {
      enabled=true
    },
  },
})
vim.keymap.set('n', '<leader>i', "<cmd>Neotree<CR>", {})
require('leap').add_default_mappings()

require('telescope').setup {
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
    -- [options]
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
  },
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.98, width = 0.98 },
    mappings = {
      i = { ["<c-t>"] = require('trouble').open_with_trouble },
      n = { ["<c-t>"] = require('trouble').open_with_trouble },
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>m", ":Telescope frecency<CR>")
vim.keymap.set('n', '<leader>z', ":Telescope zoxide list<CR>")
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>c', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>j', builtin.grep_string, {})
vim.keymap.set('n', '<leader>k', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>t', builtin.treesitter, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>l', builtin.builtin, {})
