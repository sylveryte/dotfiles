local lspconfig = require('lspconfig')
require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls", "angularls", "tailwindcss", "tsserver", "html", "emmet_ls", "prismals",
    "astro", "marksman", "rust_analyzer", "cssls" }
})


lspconfig.astro.setup {
  tsdk = {},
  capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  diagnostics = {
    enable = true,
  }
}
lspconfig.cssls.setup {
  capabilities = capabilities
}
lspconfig.prismals.setup {
  capabilities = capabilities
}
lspconfig.angularls.setup {
  capabilities = capabilities
}
lspconfig.gopls.setup {
  capabilities = capabilities
}
lspconfig.tsserver.setup {
  capabilities = capabilities
}
lspconfig.tailwindcss.setup {
  capabilities = capabilities
}
lspconfig.html.setup {
  capabilities = capabilities
}
lspconfig.lua_ls.setup {
  capabilities = capabilities,
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
