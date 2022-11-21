local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

require'lspconfig'.yamlls.setup{}
require'lspconfig'.prismals.setup{}

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
  on_attach = on_attach
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
  on_attach = on_attach,
  capabilities = capabilities,
}


-- npm i -g @angular/language-server
require('lspconfig').angularls.setup {}

-- Setup tsserver
require('lspconfig').tsserver.setup({
  on_attach = on_attach
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
null_ls.setup({
  sources = {
        -- require("null-ls").builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.prismaFmt
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.hover.dictionary,
    },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("nnoremap <silent><buffer> <Leader>p :lua vim.lsp.buf.format {async = true}<CR>")
    end
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end,
})

require('lspsaga').init_lsp_saga()
require("trouble").setup {}

