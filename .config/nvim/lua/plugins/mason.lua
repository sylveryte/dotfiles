return {
  "williamboman/mason.nvim",
  dependencies = {'neovim/nvim-lspconfig' },
  config = function()
    require("mason").setup()
  end
}
