-- vim.cmd.colorscheme "tokyonight"
vim.cmd.colorscheme "kanagawa-wave"

require 'colorizer'.setup()

vim.api.nvim_exec([[ let g:lens#disabled_filetypes = ['neo-tree'] ]], false)

vim.opt.runtimepath:append("$HOME/.local/share/treesitter")


require('nvim-treesitter.configs').setup {
  parser_install_dir = "$HOME/.local/share/treesitter",
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = {},

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

}
