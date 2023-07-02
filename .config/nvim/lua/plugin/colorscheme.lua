return {
  -- treesitter
  { "nvim-treesitter/nvim-treesitter" },
  {'norcalli/nvim-colorizer.lua'},
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
