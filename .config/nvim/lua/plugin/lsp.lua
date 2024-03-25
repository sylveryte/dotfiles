return {
  "mattn/emmet-vim",
  {
    "williamboman/mason.nvim",
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
  {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim"
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" }
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
  },
  {
    "folke/trouble.nvim",
    lazy = true,
  },
}
