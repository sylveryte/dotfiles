require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
    follow_current_file = {
      enabled = true
    },
  },
})
vim.keymap.set('n', '<leader>i', "<cmd>Neotree<CR>", {})
