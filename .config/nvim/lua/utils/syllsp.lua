-- TODO syltodo use treesitter mabybe
-- :InspectTree
local function better_link_action(action)
  if vim.bo.filetype == 'markdown' then
    local line = vim.fn.getline('.')

    local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Get the cursor position (row, col)
    local cursor_col = cursor_pos[2] + 1              -- Convert 0-based to 1-based column index

    local wikilink = line:find("%]%]")

    -- so we can get around - [ ] [[link]]
    if wikilink then
      if cursor_col < wikilink then
        local wikilinkstart = line:find('%[%[')
        if wikilinkstart <= cursor_col then
          action()
          return
        end
        vim.api.nvim_feedkeys("f];", "n", true)
      else
        vim.api.nvim_feedkeys("F];", "n", true)
      end
      vim.schedule(function()
        action()
      end)
    end
  end
  action()
end

return { better_link_action = better_link_action }
