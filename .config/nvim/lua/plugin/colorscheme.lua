return {
  -- treesitter
  { "nvim-treesitter/nvim-treesitter" },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  { 'norcalli/nvim-colorizer.lua' },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  }
}
