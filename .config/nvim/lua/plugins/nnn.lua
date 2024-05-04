local map = vim.keymap.set
require("nnn").setup({
  picker = {
    style = { border = "rounded", width = 0.5, height=0.9  },
    session = "shared",
  },
})
map("n", "-", ":NnnPicker %f<CR>")
