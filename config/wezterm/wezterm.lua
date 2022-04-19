local wezterm = require 'wezterm';

return {
  color_scheme = "Snazzy",

  window_background_opacity = 0.80,
  tab_bar_at_bottom = true,

  font_size = 14.0,
  font = wezterm.font_with_fallback({ "Dank Mono" }),

  scrollback_lines = 3500,
}
