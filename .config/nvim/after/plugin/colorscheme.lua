-- vim.cmd.colorscheme "tokyonight"
vim.cmd.colorscheme "kanagawa-wave"

-- require("colorizer").setup {}
vim.keymap.set('n', ',t', "<cmd>Twilight<CR>", {})

vim.api.nvim_exec([[ let g:lens#disabled_filetypes = ['neo-tree'] ]], false)

