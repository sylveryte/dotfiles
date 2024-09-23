return {
  "kylechui/nvim-surround",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "X",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
        change_line = "cS",
      }
    })
  end
}
