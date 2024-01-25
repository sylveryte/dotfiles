return {
  'kristijanhusak/vim-dirvish-git',
  "justinmk/vim-dirvish",
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'prochri/telescope-all-recent.nvim',
      "nvim-telescope/telescope-frecency.nvim",
      'kkharji/sqlite.lua',
      'nvim-lua/plenary.nvim',
      "jvgrootveld/telescope-zoxide",
    }
  },
  "RRethy/vim-illuminate",
  'ggandor/leap.nvim',
  'camspiers/lens.vim',
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
