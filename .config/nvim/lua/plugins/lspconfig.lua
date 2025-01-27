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
        "astro", "rust_analyzer", "cssls", "eslint", "sqls", "markdown_oxide" }
      -- , "prettier", "prettierd", "jq"
    })

    lspconfig.markdown_oxide.setup({
      -- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
      -- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
      capabilities = vim.tbl_deep_extend(
        'force',
        capabilities,
        {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        }
      ),
    })
    lspconfig.astro.setup {}
    lspconfig.rust_analyzer.setup {}
    lspconfig.sqls.setup {}
    -- lspconfig.marksman.setup {}
    lspconfig.cssls.setup {}
    lspconfig.angularls.setup {}
    lspconfig.gopls.setup {}
    lspconfig.ts_ls.setup {}
    lspconfig.tailwindcss.setup {
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
            },
          },
        },
      },
    }
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
