return {
  "luukvbaal/nnn.nvim",
  config = function()
    local map = vim.keymap.set
    require("nnn").setup({
      picker = {
        style = { border = "rounded", width = 0.5, height = 0.9 },
        session = "shared",
      },
    })
    map("n", "<leader>v", ":NnnPicker %f<CR>")
  end
}
