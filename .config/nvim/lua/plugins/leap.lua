return {
  "ggandor/leap.nvim",
  enabled=false, -- using flash.
  config = function()
    require('leap').create_default_mappings()
  end
}
