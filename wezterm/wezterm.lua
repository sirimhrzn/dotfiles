local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_background_opacity = 1
config.font_size = 10.5
config.enable_tab_bar = false
config.hide_mouse_cursor_when_typing = false
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0
}
return config

