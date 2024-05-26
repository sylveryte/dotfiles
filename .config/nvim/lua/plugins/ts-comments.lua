require('ts-comments').setup()
-- vim.keymap.set({"n","v"},"cm","gc") -- not working
vim.cmd([[nmap cm gc]])
nim.cmd([[vmap cm gc]])
