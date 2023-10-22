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
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim',
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
