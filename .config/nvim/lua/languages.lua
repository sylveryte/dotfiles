local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "html", "css", "json", "scss", "json", "lua", "markdown", "svelte", "tsx",  "vue", "vim" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
}

-- npm i -g vscode-langservers-extracted
require('lspconfig').html.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
}

-- Setup tailwind (too slow)
-- npm i -g @tailwindcss/language-server
require('lspconfig').tailwindcss.setup {
  autostart=false
}

--Enable (broadcasting) snippet capability for completion
--npm i -g vscode-langservers-extracted
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.jsonls.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}


-- npm i -g @angular/language-server
require('lspconfig').angularls.setup {}

-- Setup tsserver
require('lspconfig').tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    -- on_attach(client, bufnr)
  end,
})

-- Setup cssls
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
        -- require("null-ls").builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.hover.dictionary,
    },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>p :lua vim.lsp.buf.formatting()<CR>")
      -- format on save
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end
  end,
})

require('lspsaga').init_lsp_saga()
require("trouble").setup {}

