local wezterm = require("wezterm")

local mappings = require("mappings")
local styles = require("style")
-- local _tab_bar = require("tab_bar")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
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
	color_scheme = "Catppuccin Frappe",
	initial_cols = 120,
	initial_rows = 30,
	colors = {
		background = "#292c3c",
	},
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

-- for neovim zen mode integration.
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
