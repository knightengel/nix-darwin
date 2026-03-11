local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.colors = {
	foreground = "#8B0000",
	background = "#FFFFFF",

	cursor_bg = "#8B0000",
	cursor_border = "#8B0000",
	cursor_fg = "#8B0000",

	selection_bg = "#D80000",
	selection_fg = "#8B0000",

	ansi = {
		"#214969",
		"#E52E2E",
		"#44FFB1",
		"#FFE073",
		"#0FC5ED",
		"#a277ff",
		"#24EAF7",
		"#24EAF7",
	},

	brights = {
		"#214969",
		"#E52E2E",
		"#44FFB1",
		"#FFE073",
		"#A277FF",
		"#a277ff",
		"#24EAF7",
		"#24EAF7",
	},
}

config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.7

return config
