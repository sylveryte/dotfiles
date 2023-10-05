-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- on start
-- config.default_prog = { '/opt/homebrew/bin/zellij'}


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'BlulocoDark'
-- config.window_decorations = 'RESIZE' --frameless


config.font_size=13.0
-- config.font = wezterm.font("FiraCode Nerd Font", {weight="Regular", stretch="Normal", style="Normal" }) 
-- config.font = wezterm.font("Hack Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"}) -- /Users/sandeep/Library/Fonts/HackNerdFontPro

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.window_background_gradient = {
  colors = {  '#020311','#160107' },
  -- Specifices a Linear gradient starting in the top left corner.
  orientation = { Linear = { angle = -45.0 } },
}
config.window_padding = {
  left = 0,
  right = 0,
  top = 2,
  bottom = 0,
}


-- wezterm.on('gui-startup', function(cmd)
--   -- local tab, pane, window = mux.spawn_window(cmd or {})
--   -- window:gui_window():maximize()
-- end)

-- and finally, return the configuration to wezterm
return config
