--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
local wezterm = require 'wezterm'
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_background_opacity = 0.80
config.tab_bar_at_bottom = true
config.font_size = 14.0
config.font = wezterm.font_with_fallback({ "Dank Mono" })
config.enable_scroll_bar = true
config.scrollback_lines = 14000

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Snazzy'
  else
    return 'Material'
  end
end

function scheme_for_appearance_tabline(appearance)
  if appearance:find 'Dark' then
    return 'Tokyo Night (Gogh)'
  else
    return 'Material'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance()),

-- local theme = "Earthsong"
-- local theme = "Snazzy"
-- local theme = "Tokyo Night (Gogh)"
-- config.color_scheme = theme

-- https://github.com/michaelbrusegard/tabline.wez
tabline.setup({
  options = { 
    -- 
    -- theme = theme,
    theme = 'Tokyo Night (Gogh)',
    -- section_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thick,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thick,
    -- },
    -- component_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thin,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thin,
    -- },
    -- tab_separators = {
    --   left = wezterm.nerdfonts.ple_right_half_circle_thick,
    --   right = wezterm.nerdfonts.ple_left_half_circle_thick,
    -- },
  },
  sections = {
    tabline_a = { ' ' },
    tabline_b = { ' ' },
    tabline_c = { ' ' },
    tab_active = {
      'index',
      -- { 'parent', padding = 0 },
      -- '/',
      { 'cwd', padding = { left = 0, right = 1 }, max_length = 25 },
      { 'zoomed', padding = 0 },
    },
    tab_inactive = {
      'index',
      -- { 'parent', padding = 0 },
      -- '/',
      { 'cwd', padding = { left = 0, right = 1 }, max_length = 15 },
      -- { 'zoomed', padding = 0 },
    },
    -- tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
    tabline_x = { ' ' },
    tabline_y = { ' ', 'datetime' },
    tabline_z = { 'domain' },
    -- tabline_x = { 'ram', 'cpu' },
    -- tabline_y = { 'datetime', 'battery' },
    -- tabline_z = { 'domain' },
  },
})
tabline.apply_to_config(config)

return config