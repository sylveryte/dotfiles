return {
  "christoomey/vim-system-copy",
  {
  "giusgad/pets.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
},
  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  'numToStr/FTerm.nvim',
  'luukvbaal/nnn.nvim',
  "mbbill/undotree",
  -- { 'echasnovski/mini.ai', version = false },
  {
    "kylechui/nvim-surround", version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  }
}
