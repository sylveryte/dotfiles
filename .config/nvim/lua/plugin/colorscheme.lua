return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
   "folke/twilight.nvim",
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require("nvim-highlight-colors").setup {
        render = 'background', -- or 'foreground' or 'first_column'
        enable_named_colors = true,
        enable_tailwind = true,
      }
    end
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  -- {
  --   "NvChad/nvim-colorizer.lua", // tailwindcss doesn't work hence nvim-highlight-colors
  -- },

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
