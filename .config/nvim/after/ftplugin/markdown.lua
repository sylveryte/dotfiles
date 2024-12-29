local map = vim.keymap.set
-- toggling stuff
local function reverseTable(t)
  local r = {}
  for key, value in pairs(t) do
    r[value] = key
  end
  return r
end

local specialBucket = {
  ["[ ]"] = "[/]",
  ["[/]"] = "[x]",
  ["[x]"] = "[-]",
  ["[-]"] = "[>]",
  ["[>]"] = "[?]",
  ["[?]"] = "[!]",
  ["[!]"] = "[*]",
  ["[*]"] = "[\"]",
  ["[\"]"] = "[l]",
  ["[l]"] = "[b]",
  ["[b]"] = "[i]",
  ["[i]"] = "[S]",
  ["[S]"] = "[e]",
  ["[e]"] = "[p]",
  ["[p]"] = "[c]",
  ["[c]"] = "[f]",
  ["[f]"] = "[k]",
  ["[k]"] = "[w]",
  ["[w]"] = "[u]",
  ["[u]"] = "[d]",
  ["[d]"] = "[ ]",
}

local state_pattern = "%[.-%]"
---@param s string
---@param bucket table
local function cycle(s, bucket)
  return s:gsub(state_pattern, function(state)
    return bucket[state] or state
  end)
end

local function toggleTask()
  local sub = cycle(vim.api.nvim_get_current_line(), specialBucket)
  vim.api.nvim_set_current_line(sub)
end
local function reverseToggle()
  local sub = cycle(vim.api.nvim_get_current_line(), reverseTable(specialBucket))
  vim.api.nvim_set_current_line(sub)
end
local function resetToggle()
  local sub = vim.api.nvim_get_current_line():gsub(state_pattern, "[ ]")
  vim.api.nvim_set_current_line(sub)
end

-- toggling end

local buffer_to_string = function()
  -- gets whole buffer local content = vim.api.nvim_buf_get_li
  local content = vim.api.nvim_buf_get_lines(0, 0, 2, false)
  return table.concat(content, "\n")
end

local navigateForward = function()
  vim.cmd([[:exe "norm gg0}j$gd"]])
end

local navigateBack = function()
  vim.cmd([[:exe "norm gg0}jwgd"]])
end

local replace = function()
  vim.cmd([[:%s/ SYLNEWLINE/\r/g]])
end



vim.opt_local.wrap = false   -- Disable line wrap
vim.opt_local.textwidth = 60 -- for gqip formatting
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>u", ":Today<CR>")
map("n", "<localleader>o", ":Tommorow<CR>")
map("n", "<localleader>y", ":Tommorow<CR>")
map("n", "<localleader>p", function()
  replace()
end, { desc = "replace SYLNEWLINE" })

map("n", "<localleader>k", function()
  navigateForward()
end, { desc = "Go syl forward", silent = true })
map("n", "<localleader>j", function()
  navigateBack()
end, { desc = "Go syl back", silent = true })

map("n", "<C-Space>", function()
  toggleTask()
end, { desc = "Toggle task" })
map("n", "<C-x>", function()
  reverseToggle()
end, { desc = "Reverse toggle task" })
map("n", "<S-x>", function()
  resetToggle()
end, { desc = "Reverse toggle task" })

map("n", "<localleader>W", ":set wrap!<CR>", { desc = "Wrap" })
