local map = vim.keymap.set
require('nnn').setup()
map("n", "-", ":NnnPicker %f<CR>")
