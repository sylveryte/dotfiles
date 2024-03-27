return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,     -- We'd like this plugin to load first out of the rest
    config = true,       -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {

    'nvim-neorg/neorg',
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" }, { "luarocks.nvim" } },
  }

}
