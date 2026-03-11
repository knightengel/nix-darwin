local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- основной цветовой стиль
config.colors = {
	foreground = "#8B0000",
	background = "#FFFFFF",

	cursor_bg = "#8B0000",
	cursor_border = "#8B0000",
	cursor_fg = "#FFFFFF",

	selection_bg = "#D80000",
	selection_fg = "#FFFFFF",

	ansi = {
		"#214969",
		"#E52E2E",
		"#44FFB1",
		"#FFE073",
		"#0FC5ED",
		"#A277FF",
		"#24EAF7",
		"#E5E5E5",
	},

	brights = {
		"#214969",
		"#E52E2E",
		"#44FFB1",
		"#FFE073",
		"#A277FF",
		"#A277FF",
		"#24EAF7",
		"#FFFFFF",
	},
}

-- шрифт
config.font = wezterm.font("JetBrains Mono")
config.font_size = 19

-- убираем таббар (у тебя yabai)
config.enable_tab_bar = false
config.window_decorations = "NONE"

-- немного приятнее выглядит
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- прозрачность
config.window_background_opacity = 0.7

-- меньше лагов при рендере
config.max_fps = 120
config.animation_fps = 120

-- курсор
config.default_cursor_style = "BlinkingBar"

-- отключает annoying bell
config.audible_bell = "Disabled"

-- macOS nicer
config.native_macos_fullscreen_mode = true

return config
