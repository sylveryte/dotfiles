local map = vim.keymap.set
map("n", "<localleader>r", ":FloatermNew --autoclose=0 --disposable cargo run<CR>")
