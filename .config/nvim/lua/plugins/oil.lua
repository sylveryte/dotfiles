require("oil").setup(
{
  keymaps = {
      ["<C-h>"] =false,
      ["<C-l>"] =false,
  }
}
)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
