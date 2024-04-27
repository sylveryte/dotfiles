local map = vim.keymap.set

require("nvim-surround").setup()
require("nnn").setup()

map("n", "<leader>g", "<cmd>:Git<cr>")
map({ "n", "v" }, "cm", "<Plug>Commentary")
map("n", "gb", ":Git blame<CR>")

-- neo float term
local fterm = require('FTerm')
fterm.setup({
  border     = 'solid',
  dimensions = {
    height = 0.85,
    width = 0.85,
  },
})
map({ 'n', 't', 'i' }, '<A-a>', function() fterm.toggle() end, { desc = "Toggle floating term" })
map("n", "<leader>v", function() fterm.scratch({ cmd = {"nnn",vim.api.nvim_buf_get_name(0) }}) end, { desc = "Open nnn" })
-- runners
local runners = { lua = 'lua', javascript = 'node', go = "make run", rust = "cargo run" }
map('n', '<leader><Enter>', function()
  local buf = vim.api.nvim_buf_get_name(0)
  local ftype = vim.filetype.match({ filename = buf })
  local exec = runners[ftype]
  if exec ~= nil then
    fterm.run(exec)
  end
end, { desc = 'Run the program' })
-- web runners
local npmrundev = fterm:new({ ft = 'fterm_npmrundev', cmd = "npm run dev" })

map({'n','t'}, '<leader>rr', function()
  npmrundev:toggle()
end, { desc = "npm run dev" })


map("n", "<leader>n", ":NnnExplorer<CR>")
map('n', '<leader>u', vim.cmd.UndotreeToggle)
