local map = vim.keymap.set
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
-- runners
local runners = { lua = 'lua', javascript = 'node', go = "go run", rust = "cargo run" }
map('n', '<localleader>r', function()
  local buf = vim.api.nvim_buf_get_name(0)
  local ftype = vim.filetype.match({ filename = buf })
  local exec = runners[ftype]
  if exec ~= nil then
    fterm.run(exec .. ' ' .. buf)
  end
end, { desc = 'Run the program' })
map({'t','n'}, '<leader>rr', function()
    fterm.toggle()
end, { desc = 'Toggle the program runner' })
-- web runners
local npmrundev = fterm:new({ ft = 'fterm_npmrundev', cmd = "npm run dev" })
local npmrunstart = fterm:new({ ft = 'fterm_npmrunstart', cmd = "npm run start" })

map({'n','t'}, '<leader>rd', function()
  npmrundev:toggle()
end, { desc = "npm run dev" })
map({'n','t'}, '<leader>rs', function()
  npmrunstart:toggle()
end, { desc = "npm run start" })
