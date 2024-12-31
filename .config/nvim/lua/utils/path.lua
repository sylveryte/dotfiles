local function find_syl_root_dir()
  local markers = { ".sylroot" }

  -- Go up the directory tree looking for a root marker
  local cwd = vim.fn.expand('%:p:h') --current file dir
  while cwd ~= "/" do
    for _, marker in ipairs(markers) do
      local marker_path = cwd .. "/" .. marker
      if vim.fn.filereadable(marker_path) == 1 then
        return cwd
      end
    end
    -- Go up one directory
    cwd = vim.fn.fnamemodify(cwd, ":h")
    print('searching in'..cwd)
  end

  -- Return current directory if no root is found
  return vim.fn.getcwd()
end

local M = { find_syl_root_dir= find_syl_root_dir }
return M
