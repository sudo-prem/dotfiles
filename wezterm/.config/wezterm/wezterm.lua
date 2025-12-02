local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.max_fps = 120
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", scale = 1, weight = "Regular" },
})
config.font_size = 14
config.window_background_opacity = 0.90
config.macos_window_background_blur = 14
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
	left = "0.25cell",
	right = "0.25cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

config.default_workspace = "sudo-term"
config.scrollback_lines = 3000

config.inactive_pane_hsb = {
	brightness = 0.35,
}

config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = true
config.native_macos_fullscreen_mode = true

wezterm.on("update-status", function(window, pane)
	local stat = window:active_workspace()
	local stat_color = "#f7768e"

	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "leader"
		stat_color = "#bb9af7"
	end

	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.md_apple_keyboard_command .. "  " .. stat },
		{ Text = " |" },
	}))

	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	local cwd_uri = pane:get_current_working_dir()
	local cwd = basename(cwd_uri.file_path)
	local cmd = basename(pane:get_foreground_process_name())

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.cod_folder_opened .. "  " .. cwd },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.oct_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = "  " },
	}))
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 777 }
config.keys = {
	{ key = "c",          mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	{
		key = 'h',
		mods = 'ALT',
		action = act.SplitPane {
			direction = 'Left',
			size = { Percent = 50 },
		},
	},
	{
		key = 'j',
		mods = 'ALT',
		action = act.SplitPane {
			direction = 'Down',
			size = { Percent = 50 },
		},
	},
	{
		key = 'k',
		mods = 'ALT',
		action = act.SplitPane {
			direction = 'Up',
			size = { Percent = 50 },
		},
	},
	{
		key = 'l',
		mods = 'ALT',
		action = act.SplitPane {
			direction = 'Right',
			size = { Percent = 50 },
		},
	},
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },

	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	{
		key = "R",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "rename tab to" },
			}),
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h",      action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j",      action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k",      action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l",      action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h",      action = act.MoveTabRelative(-1) },
		{ key = "j",      action = act.MoveTabRelative(-1) },
		{ key = "k",      action = act.MoveTabRelative(1) },
		{ key = "l",      action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},
}

return config
