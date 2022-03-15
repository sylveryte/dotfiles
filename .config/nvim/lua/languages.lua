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


-- -- Setup Emmet
-- --  npm i -g emmet-ls
-- require('lspconfig').emmet_ls.setup {
--   on_attach = on_attach,
--   filetypes = { 'html', 'css', 'typescriptreact', 'typescript', 'scss' },
-- }

-- npm i -g vscode-langservers-extracted
require('lspconfig').html.setup {
  on_attach = on_attach,
}

-- Setup tailwind (too slow)
-- npm i -g @tailwindcss/language-server
require('lspconfig').tailwindcss.setup {}

-- npm i -g @angular/language-server
require('lspconfig').angularls.setup {}

-- Setup tsserver
require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = true
    -- client.resolved_capabilities.document_range_formatting = true
    -- on_attach(client, bufnr)
  end,
}

-- Setup cssls
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspsaga').init_lsp_saga()

 require("trouble").setup {}


-- devicons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = { };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

-- prettier
local prettier = require("prettier")
local null_ls = require("null-ls")
null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      -- vim.cmd("nnoremap <silent><buffer> <Leader>p :lua vim.lsp.buf.formatting()<CR>")
      -- format on save
      -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end
    if client.resolved_capabilities.document_range_formatting then
      -- vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
  sources = {
    null_ls.builtins.hover.dictionary,
    -- null_ls.builtins.completion.spell,
  }
})
prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "lua",
  },
})
