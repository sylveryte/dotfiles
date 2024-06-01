local map = vim.keymap.set

local buffer_to_string = function()
  -- gets whole buffer local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  local content = vim.api.nvim_buf_get_lines(0, 0, 2, false)
  return table.concat(content, "\n")
end

local navigateForward =  function()
  local text = buffer_to_string()
  local isDoc = text:find('@document', 1, true)
  if isDoc ~= nil then
    vim.cmd([[:norm gg0}}j$gd<CR>]])
  else
    vim.cmd([[:norm gg0}j$gd<CR>]])
  end
end

local navigateBack =  function()
  local text = buffer_to_string()
  local isDoc = text:find('@document', 1, true)
  if isDoc ~= nil then
    vim.cmd([[:norm gg0}}jgd<CR>]])
  else
    vim.cmd([[:norm gg0}jgd<CR>]])
  end
end


vim.opt_local.wrap = false -- Disable line wrap
vim.opt_local.textwidth = 60 -- for gqip formatting
map("n", "<localleader>c", ":Neorg toggle-concealer<CR>")
map("n", "<localleader>im", ":Neorg inject-metadata<CR>")
map("n", "<localleader>b", ":Neorg toc<CR>")
map("n", "<localleader>g", ":Neorg journal custom<CR>")
map("n", "<localleader>p", "gg=G:%s/ SYLNEWLINE/\\r/g<CR>gg=G<C-o>zR", { desc = "Indent using =" })

map("n", "<localleader>k",function ()
 navigateForward()
end , { desc = "Go syl forward" })
map("n", "<localleader>j",function ()
 navigateBack()
end , { desc = "Go syl back" })

map("n", "<localleader>Wn", ":set nowrap<CR>", { desc = "No Wrap" })
map("n", "<localleader>W", ":set wrap<CR>", { desc = "Wrap" })

map("n", "<localleader>e", ":normal F{f*dt}F{<CR>")
map("i", "<C-a>", ':normal f}a[]<CR>F/l"jyt:f["jpf]a')
map("i", "<C-q>", ':normal F{f*dt}f]<CR>a')
map("n", "<localleader>a", ':normal f}a[]<CR>F/l"jyt:f["jpf]<CR>')


-- vim.api.nvim_exec([[ autocmd BufWritePre * <localleader>p ]], false) --not working
