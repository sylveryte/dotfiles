local map = vim.keymap.set

local buffer_to_string = function()
  -- gets whole buffer local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  local content = vim.api.nvim_buf_get_lines(0, 0, 2, false)
  return table.concat(content, "\n")
end

local navigateForward = function()
  local text = buffer_to_string()
  local isDoc = text:find('@document', 1, true)
  if isDoc ~= nil then
   vim.cmd([[:exe "norm gg0}}j$\<CR>0M"]])
  else
   vim.cmd([[:exe "norm gg0}j$\<CR>0M"]])
  end
end

local navigateBack = function()
  local text = buffer_to_string()
  local isDoc = text:find('@document', 1, true)
  if isDoc ~= nil then
   vim.cmd([[:exe "norm gg0}}j\<CR>0M"]])
  else
   vim.cmd([[:exe "norm gg0}j\<CR>0M"]])
  end
end

local indentAndFormat = function()
  local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local text = table.concat(content, "\n")
  local isSyl = text:find('SYLNEWLINE', 0, true)
  local curWin = vim.api.nvim_get_current_win()
  local lp = vim.api.nvim_win_get_cursor(curWin)
  if isSyl ~= nil then
    vim.cmd([[:%s/ SYLNEWLINE/\r/g]])
    vim.cmd([[:norm gg=G]])
    -- vim.cmd([[:norm <C-o>]])
  else
    vim.cmd([[:norm gg=G]])
    vim.print("hel")
  end
  vim.api.nvim_win_set_cursor(curWin, lp)
  vim.cmd([[:norm zz]])
end


vim.opt_local.wrap = false   -- Disable line wrap
vim.opt_local.textwidth = 60 -- for gqip formatting
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>im", ":Neorg inject-metadata<CR>")
map("n", "<localleader>b", ":Neorg toc<CR>")
map("n", "<localleader>g", ":Neorg journal custom<CR>")
map("n", "<localleader>p", "", { desc = "Indent using =" })
map("n", "<localleader>p", function()
  indentAndFormat()
end, { desc = "Indent = and format SYLNEWLINE" })

map("n", "<localleader>k", function()
  navigateForward()
end, { desc = "Go syl forward" })
map("n", "<localleader>j", function()
  navigateBack()
end, { desc = "Go syl back" })

map("n", "<localleader>Wn", ":set nowrap<CR>", { desc = "No Wrap" })
map("n", "<localleader>W", ":set wrap<CR>", { desc = "Wrap" })

map("n", "<localleader>e", ":normal F{f*dt}F{<CR>")
map("i", "<C-a>", ':normal f}a[]<CR>F/l"jyt:f["jpf]a')
map("i", "<C-q>", ':normal F{f*dt}f]<CR>a')
map("n", "<localleader>a", ':normal f}a[]<CR>F/l"jyt:f["jpf]<CR>')

map("i", "<C-f>", function() vim.cmd([[:Telescope neorg insert_link]]) end);
map("i", "<C-l>", function() vim.cmd([[:Telescope neorg insert_file_link]]) end);
-- map("i", "<S-Enter>", function() vim.cmd([[<Plug>(neorg.itero.next-iteration)]]) end);

-- vim.api.nvim_exec([[ autocmd BufWritePre * <localleader>p ]], false) --not working
