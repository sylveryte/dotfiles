return {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TsUpdate"
  },
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
