local map = vim.keymap.set
vim.cmd([[nmap <expr> <localleader>r db#op_exec()]])
vim.cmd([[xmap <expr> <localleader>r db#op_exec()]])
