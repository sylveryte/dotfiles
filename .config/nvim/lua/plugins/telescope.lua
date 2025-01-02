return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "jvgrootveld/telescope-zoxide"
  },
  config = function()
    require('telescope').load_extension('zoxide')
    require('telescope').load_extension('frecency')
    local spath = require('utils/path')
    require("frecency.config").setup {
      auto_validate = true,
      db_validate_threshold = 100
    }
    require('telescope').setup(
      {
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
    )
    local map = vim.keymap.set
    local builtin = require('telescope.builtin')
    map("n", "<leader>m", ":Telescope frecency<CR>", { desc = "Telescope frecency" })
    map('n', '<leader>z', ":Telescope zoxide list<CR>", { desc = "Telescope zoxide" })
    map('n', '<leader>f', builtin.find_files, { desc = "telescope find files og" })
    map('n', '<leader>v', function()
      builtin.git_files({ cwd = vim.fn.expand('%:p:h')})
    end, { desc = "telescope find files with cur dir context" })
    map('n', '<leader>c', function()
      builtin.find_files({ cwd = spath.find_syl_root_dir() })
    end, { desc = "telescope find files from current file's dir" })
    map('n', '<leader>s', builtin.live_grep, { desc = "telescope live grep" })
    map('n', '<leader>b', builtin.buffers, { desc = "telescope buffers" })
    map('n', '<leader>j', builtin.grep_string, { desc = "telescope grep string" })
    map('n', '<leader>k', builtin.oldfiles, { desc = "telescope oldfiles" })
    map('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "telescope current_buffer_fuzzy_find" })
    map('n', '<leader>t', builtin.treesitter, { desc = "telescope treesitter" })
    map('n', 'gd', builtin.lsp_definitions, { desc = "telescope lsp_definitions" })
    map('n', '<leader>gi', builtin.lsp_implementations, { desc = "telescope lsp_implementations" })
    map('n', 'gr', builtin.lsp_references, { desc = "telescope lsp_references" })
    map('n', '<leader>l', builtin.builtin, { desc = "telescope list builtins" })
  end
}
