  local map = vim.keymap.set

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

  local toggleTask = function ()
    local l = vim.api.nvim_get_current_line()
    local isEmpty = l:find('[ ]',1,true)
    local isProg = l:find('[-]',1,true)
    local isDone = l:find('[x]',1,true)
    if isEmpty ~= nil then
      local lsubbed = l.gsub(l,'%[ %]','[-]',1)
      vim.api.nvim_set_current_line(lsubbed)
    elseif isProg ~= nil then
      local lsubbed = l.gsub(l,'%[%-%]','[x]',1)
      vim.api.nvim_set_current_line(lsubbed)
    elseif isDone ~= nil then
      local lsubbed = l.gsub(l,'%[x%]','[ ]',1)
      vim.api.nvim_set_current_line(lsubbed)
    end
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
  end, { desc = "Toggle task"})

  map("n", "<localleader>Wn", ":set nowrap<CR>", { desc = "No Wrap" })
  map("n", "<localleader>W", ":set wrap<CR>", { desc = "Wrap" })
