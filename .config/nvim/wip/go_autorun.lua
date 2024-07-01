-- local currentBufNumber = vim.api.nvim_get_current_buf()
local bufn = 70


vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "main.go",
  group = vim.api.nvim_create_augroup("sylsaverun", { clear = true }),
  callback = function()
    -- write to buffer
    vim.fn.jobstart({ "go", "run", "main.go" }, {
      --send onle at a time
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufn, -1, -1, false, data)
        end
      end
    })
  end
})
