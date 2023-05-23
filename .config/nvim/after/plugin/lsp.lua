local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- vim.cmd("nnoremap <silent><buffer> <Leader>p :lua vim.lsp.buf.format()<CR>")

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

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

lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.prismals.setup {
  -- on_attach = on_attach,
  capabilities = capabilities
}
lspconfig.angularls.setup {
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

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "angularls", "tailwindcss", "tsserver", "html", "emmet_ls", "prismals", "astro" }
})


local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rustywind,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.code_actions.refactoring,
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.jsonlint,
  },
  on_attach = function(client, bufnr)
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

require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = true,
})

-- lspsaga ----------------------------------------------------
require("lspsaga").setup({
  symbol_in_winbar = {
    enable = false,
  }
})
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "<leader>a", "<cmd>Lspsaga lsp_finder<CR>")
-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
-- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
-- Go to definition
-- keymap("n","<leader>gd", "<cmd>Lspsaga goto_definition<CR>")
-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- Go to type definition
-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[E", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]E", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[e", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]e", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")




----- Trouble.nvim --------------------------------------------------------

require("trouble").setup {}
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)
