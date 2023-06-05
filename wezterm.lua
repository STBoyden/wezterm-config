local wezterm = require("wezterm")

local mappings = require("mappings")
local styles = require("style")
-- local _tab_bar = require("tab_bar")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local function theme(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappe"
	else
		return "Catppuccin Latte"
	end
end

config = {
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	font_size = 12.0,
	font = wezterm.font("IntelOneMono Nerd Font", { weight = "Medium" }),
	default_cursor_style = "BlinkingUnderline",
	detect_password_input = true,
	disable_default_key_bindings = true,
	keys = mappings,
	default_prog = { "/bin/fish" },
	warn_about_missing_glyphs = false,
	-- appearance configuration
	color_scheme = theme(wezterm.gui.get_appearance()),
	initial_cols = 120,
	initial_rows = 30,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	tab_max_width = 24,
	window_frame = styles.window_frame,
	window_background_opacity = 1.0,
}

return config
