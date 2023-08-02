local wezterm = require("wezterm")

local SOLID_LEFT_HALF_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

local function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)

	local background = ""
	local foreground = "#0c0c0c"

	if #title > max_width then
		title = wezterm.truncate_right(title, max_width - 3) .. "..."
	end

	if tab.is_active then
		background = "#b696e7"
	else
		background = "#818385"
	end

	local edge_foreground = background
	local edge_background = foreground

	local left_text = SOLID_LEFT_HALF_CIRCLE
	local right_text = SOLID_RIGHT_HALF_CIRCLE

	if tab.tab_index == 0 then
		left_text = " " .. SOLID_LEFT_HALF_CIRCLE
		right_text = "█"
	elseif tab.tab_index ~= #tabs - 1 then
		left_text = "█"
		right_text = "█"
	else -- last tab
		left_text = "█"
		right_text = SOLID_RIGHT_HALF_CIRCLE .. " "
	end

	return {
		{ Foreground = { Color = edge_foreground } },
		{ Background = { Color = edge_background } },
		{ Text = left_text },
		{ Foreground = { Color = foreground } },
		{ Background = { Color = background } },
		{ Text = string.format("[%d] %s", tab.tab_index, title) },
		{ Foreground = { Color = edge_foreground } },
		{ Background = { Color = edge_background } },
		{ Text = right_text },
	}
end)

return {}
