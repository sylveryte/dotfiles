local map = vim.keymap.set

vim.opt_local.wrap = false -- Disable line wrap
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>im", ":Neorg inject-metadata<CR>")
map("n", "<localleader>b", ":Neorg toc<CR>")
map("n", "<localleader>p", "gg=G<C-o>zR:%s/ SYLNEWLINE/\\r/g<CR>gg=G<C-o>zR", { desc = "Indent using =" })

map("n", "<localleader>k", ":norm gg0}j$gd<CR>", { desc = "Go syl next" })
map("n", "<localleader>j", ":norm gg0}jgd<CR>", { desc = "Go syl back" })
map("n", "<localleader>K", ":norm gg0}}j$gd<CR>", { desc = "Go syl next with meta" })
map("n", "<localleader>J", ":norm gg0}}jgd<CR>", { desc = "Go syl back with meta" })

map("n", "<localleader>r", ":set nowrap<CR>", { desc = "No Wrap" })
map("n", "<localleader>R", ":set wrap<CR>", { desc = "Wrap" })

map("n", "<localleader>e", ":normal F{f*dt}F{<CR>")
map("i", "<C-a>", ':normal f}a[]<CR>F/l"jyt:f["jpf]a')
map("i", "<C-q>", ':normal F{f*dt}f]<CR>a')
map("n", "<localleader>a", ':normal f}a[]<CR>F/l"jyt:f["jpf]<CR>')


-- vim.api.nvim_exec([[ autocmd BufWritePre * <localleader>p ]], false) --not working
