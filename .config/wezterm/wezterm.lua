local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	--window_decorations = "RESIZE",
	default_cursor_style = "SteadyBlock",
	color_scheme = "Ashes (base16)",
	font = wezterm.font("JetBrains Mono", { weight = "DemiBold" }),
	font_size = 10.6,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
}

return config
