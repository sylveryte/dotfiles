require('ts-comments').setup()
vim.keymap.set({"n","v"},"cm","gc") -- not working
vim.cmd([[nmap cm gc]])
vim.cmd([[vmap cm gc]])
