local wezterm = require("wezterm")
local mappings = require("mappings")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 13.0

config.disable_default_key_bindings = true
config.keys = mappings

config.default_prog = { "/var/home/sboyden/.cargo/bin/nu" }
config.color_scheme = "carbonfox"

config.initial_cols = 120
config.initial_rows = 30

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_frame = {
	active_titlebar_bg = "#161616",
	button_bg = "#161616",
}

return config
