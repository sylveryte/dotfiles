return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
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
    lazy=true,
  },
}
