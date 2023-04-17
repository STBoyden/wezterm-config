local wezterm = require("wezterm")

local mappings = {
	-- region: debug bindings
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowDebugOverlay,
	},
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	-- endregion

	-- region: tabs configuration and navigation
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "W",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
	},
	{
		key = "D",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
	-- endregion

	-- region: pane configuration, navigation, and resizing
	{
		key = "\\",
		mods = "CTRL",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "J",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "L",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
	},
	{
		key = "p",
		mods = "CTRL",
		action = wezterm.action.PaneSelect,
	},
	-- endregion

	-- region: miscellaneous bindings
	{
		key = "/",
		mods = "CTRL",
		action = wezterm.action({ Search = { CaseInSensitiveString = "" } }),
	},
	{
		key = "u",
		mods = "CTRL",
		action = wezterm.action.CharSelect,
	},
	-- endregion

	-- region: clipboard bindings
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	-- endregion
}

return mappings
