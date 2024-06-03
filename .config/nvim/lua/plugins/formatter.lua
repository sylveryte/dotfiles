local map = vim.keymap.set
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    typescriptreact = require("formatter.defaults.prettierd"),
    typescript= require("formatter.defaults.prettierd"),
    javascript = require("formatter.defaults.prettierd"),
    javascriptreact = require("formatter.defaults.prettierd"),
    html = require("formatter.defaults.prettierd"),
    css = require("formatter.defaults.prettierd"),
    scss = require("formatter.defaults.prettierd"),
    json = require("formatter.defaults.prettierd"),

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})

map("n", "<leader>p", "<cmd>:Format<cr>")
