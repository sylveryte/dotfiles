local function current_file_dir_path()
  local path = vim.fn.expand('%:p:h') --current file dir

  if string.sub(path, 1, 7) == "oil://" then
    -- Remove the "oil://" prefix
    return string.sub(path, 8)
  else
    return path
  end
end

local function find_syl_root_dir()
  local markers = { ".sylroot" }

  -- Go up the directory tree looking for a root marker
  local cwd = current_file_dir_path()
  while cwd ~= "/" do
    for _, marker in ipairs(markers) do
      local marker_path = cwd .. "/" .. marker
      if vim.fn.filereadable(marker_path) == 1 then
        return cwd
      end
    end
    -- Go up one directory
    cwd = vim.fn.fnamemodify(cwd, ":h")
  end

  -- Return current directory if no root is found
  return vim.fn.getcwd()
end

local M = { find_syl_root_dir = find_syl_root_dir, current_file_dir_path = current_file_dir_path }
return M
