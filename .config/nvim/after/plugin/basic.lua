local map = vim.keymap.set

require("pets").setup({
  row=5,
  col=0,
  death_animation = true,
  popup = {
    width = "150%",
    winblend = 100,
  }
})
vim.cmd('PetsNewCustom dog black hectooor')

require("nvim-surround").setup()
require("nnn").setup()

map("n", "<leader>g", "<cmd>:Git<cr>")
map("n", "cm", "<Plug>Commentary")
map("n", "gb", ":Git blame<CR>")
map("n", "<leader>v", ":FloatermNew --autoclose=1 --opener=vsplit nnn<CR>")
map("n", "<leader>n", ":NnnExplorer<CR>")
map('n', '<leader>u', vim.cmd.UndotreeToggle)
