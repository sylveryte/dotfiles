local map = vim.keymap.set
-- require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require("telescope").load_extension("gitmoji")
require('telescope').load_extension('frecency')
-- require('telescope').load_extension("ag")
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
map('n','<leader>tg',require('telescope').extensions.gitmoji.gitmoji)
map("n", "<leader>m", ":Telescope frecency<CR>")
map('n', '<leader>z', ":Telescope zoxide list<CR>", {desc="Telescope zoxide"})
map('n', '<leader>f', builtin.find_files, { desc = "telescope find files" })
map('n', '<leader>c', builtin.git_files, { desc = "telescope git files" })
map('n', '<leader>s', builtin.live_grep, { desc = "telescope live grep" })
map('n', '<leader>b', builtin.buffers, { desc = "telescope buffers" })
map('n', '<leader>j', builtin.grep_string, { desc = "telescope grep string" })
map('n', '<leader>k', builtin.oldfiles, { desc = "telescope oldfiles" })
map('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "telescope current_buffer_fuzzy_find" })
map('n', '<leader>t', builtin.treesitter, { desc = "telescope treesitter" })
map('n', 'gd', builtin.lsp_definitions, { desc = "telescope lsp_definitions" })
map('n', '<leader>gi', builtin.lsp_implementations, { desc = "telescope lsp_implementations" })
map('n', 'gr', builtin.lsp_references, { desc="telescope lsp_references" })
map('n', '<leader>l', builtin.builtin, { desc="telescope list builtins" })
