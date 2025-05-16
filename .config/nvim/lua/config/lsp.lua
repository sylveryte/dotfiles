vim.lsp.config.sylmark = {
  cmd = { "/home/sylveryte/projects/sylmark/sylmark" },
  root_markers = { '.sylroot' },
  filetypes = { 'markdown' },
}

vim.lsp.config.ledger_lsp = {
  cmd = { "/home/sylveryte/projects/ledger-lsp/ledger-lsp" },
  root_markers = { '.git' },
  filetypes = { 'ledger' },
}


vim.lsp.config.markdown_oxide = {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_user_command(
      "Daily",
      function(args)
        local input = args.args
        vim.lsp.buf.execute_command({ command = "jump", arguments = { input } })
      end,
      { desc = 'Open daily note', nargs = "*" }
    )
  end
}

vim.lsp.config.lua_ls = {
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

vim.lsp.enable({ "sylmark", "ledger_lsp",
  "lua_ls", "gopls", "ts_ls", "cssls", "astro", "svelte", "markdown_oxide", "tailwindcss" })
