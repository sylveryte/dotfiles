local opt = vim.opt

-- opt.autowrite = true -- Enable auto write
-- opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.conceallevel = 3         -- Hide * markup for bold and italic
opt.foldenable = false
opt.confirm = true           -- Confirm to save changes before exiting modified buffer
opt.cursorline = true        -- Enable highlighting of the current line
opt.expandtab = true         -- Use spaces instead of tabs
opt.formatoptions = "jroqln" -- check :h fo-table
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = false     -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.laststatus = 0
opt.list = true            -- Show some invisible characters (tabs...
opt.listchars:append {
  eol = "↴",
  tab = "¦ "
}
opt.mouse = "a"           -- Enable mouse mode
opt.number = true         -- Print line number
opt.pumblend = 10         -- Popup blend
opt.pumheight = 10        -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
-- opt.scrolloff = 8 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true    -- Round indent
opt.shiftwidth = 2       -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false     -- Dont show mode since we have a statusline
opt.sidescrolloff = 8    -- Columns of context
opt.signcolumn = "yes"   -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true     -- Don't ignore case with capitals
opt.smartindent = true   -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true    -- Put new windows below current
opt.splitright = true    -- Put new windows right of current
opt.tabstop = 2          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 1000
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
-- opt.background = "light"
-- opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.diagnostic.config(
  {
    virtual_text = true,
    -- below instead of true for only Warn, no err
    -- {
    --   -- severity = {
    --   --   max = vim.diagnostic.severity.WARN,
    --   -- },
    -- },
    virtual_lines = {
      current_line = true,
      severity = {
        min = vim.diagnostic.severity.ERROR,
      },
    },
  }
)
