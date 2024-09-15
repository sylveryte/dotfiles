return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lspconfig = require('lspconfig')
    require("mason").setup()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "gopls", "angularls", "tailwindcss", "ts_ls", "html",
        "astro", "marksman", "rust_analyzer", "cssls", "eslint", "sqls" }
    })
    lspconfig.astro.setup {}
    lspconfig.rust_analyzer.setup {}
    lspconfig.sqls.setup {}
    lspconfig.marksman.setup {}
    lspconfig.cssls.setup {}
    lspconfig.angularls.setup {}
    lspconfig.gopls.setup {}
    lspconfig.tsserver.setup {}
    lspconfig.tailwindcss.setup {}
    lspconfig.eslint.setup {}
    lspconfig.html.setup {}
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        }
      }
    }
  end
}
