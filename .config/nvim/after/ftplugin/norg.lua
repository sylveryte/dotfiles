local map = vim.keymap.set

vim.opt_local.wrap = false -- Disable line wrap
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>im", ":Neorg inject-metadata<CR>")
map("n", "<localleader>p", "gg=G<C-o>zR:%s/ SYLNEWLINE/\\r/g<CR>gg=G<C-o>zR", { desc = "Indent using =" })

map("n", "<localleader>k", ":norm Ggg0}j$gd<CR>", { desc = "Go syl next" })
map("n", "<localleader>j", ":norm Ggg0}jgd<CR>", { desc = "Go syl back" })


-- vim.api.nvim_exec([[ autocmd BufWritePre * <localleader>p ]], false) --not working
