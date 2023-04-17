local wezterm = require("wezterm")
local mappings = require("mappings")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	font_size = 13.0,
	disable_default_key_bindings = true,
	keys = mappings,
	default_prog = { "/var/home/sboyden/.cargo/bin/nu" },
	warn_about_missing_glyphs = false,
	-- appearance configuration
	color_scheme = "carbonfox",
	initial_cols = 120,
	initial_rows = 30,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_frame = {
		active_titlebar_bg = "#161616",
		button_bg = "#161616",
	},
}

return config
