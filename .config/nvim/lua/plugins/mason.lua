local lspconfig = require('lspconfig')
require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls", "angularls", "tailwindcss", "tsserver", "html", "emmet_ls", "prismals",
    "astro", "marksman", "rust_analyzer" }
})


lspconfig.astro.setup {
  on_attach = on_attach,
  tsdk = {},
  capabilities = capabilities
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  diagnostics = {
    enable = true,
  }
}
lspconfig.prismals.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

