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

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function setcolorscheme(appearance)
  if appearance:find 'Dark' then
    -- config.color_scheme = 'UnderTheSea'
    -- config.color_scheme = 'Tango (base16)'
    -- config.color_scheme = 'VWbug (terminal.sexy)' -- coffeeeee
    config.color_scheme = 'Unsifted Wheat (terminal.sexy)'
    config.color_scheme = 'Bamboo Multiplex'
  else
    -- config.color_scheme = 'Tomorrow (Gogh)'
    -- config.color_scheme = 'Alabaster'
    -- config.color_scheme = 'Toy Chest (Gogh)'
    config.color_scheme = 'Atelierdune (light) (terminal.sexy)'
    config.color_scheme = 'Tokyo Night Day'
    config.color_scheme = 'Bamboo Light'
    -- config.color_scheme = 'Belafonte Day'
  end
end

print(get_appearance())
setcolorscheme(get_appearance())
-- config.window_decorations = 'RESIZE' --frameless


config.font_size = 12.0
-- config.font = wezterm.font("FiraCode Nerd Font", {weight="Regular", stretch="Normal", style="Normal" })
-- config.font = wezterm.font("MesloLGM Nerd Font", {weight="Regular", stretch="Normal", style="Normal" })
-- config.font = wezterm.font("Inconsolata Nerd Font", {weight="Regular", stretch="Normal", style="Normal" })
config.font = wezterm.font("Cousine Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- config.font = wezterm.font("Hack Nerd Font Propo")
wezterm.font_with_fallback({
  -- /usr/share/fonts/TTF/JetBrainsMono-Regular.ttf, FontConfig
  "JetBrains Mono",

  -- /usr/share/fonts/TTF/SymbolsNerdFontMono-Regular.ttf, FontConfig
  "Symbols Nerd Font Mono",

  -- /usr/share/fonts/noto/NotoColorEmoji.ttf, FontConfig
  -- Assumed to have Emoji Presentation
  -- Pixel sizes: [128]
  "Noto Color Emoji",

})

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
-- config.window_background_gradient = {
--   colors = {  '#020311','#160107' },
--   -- Specifices a Linear gradient starting in the top left corner.
--   orientation = { Linear = { angle = -45.0 } },
-- }
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
