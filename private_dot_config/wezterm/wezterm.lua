local wezterm = require "wezterm"

return {
	font                      = wezterm.font "CozetteDrawing",
	font_size                 = 13,
	--color_scheme              = "Catppuccin Mocha",
	color_scheme              = "Japanesque",
	enable_tab_bar            = false,
	window_background_opacity = 0.7,
	xcursor_theme             = "Vimix-white-cursors",
	
	-- I have tmux and i suspect this is causing my RAM problems
	scrollback_lines          = 0,

	-- Wezterm does not support Hyprland without crashing yet.
	-- enable_wayland            = false,
}
