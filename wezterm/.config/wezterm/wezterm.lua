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
config.send_composed_key_when_left_alt_is_pressed = false
config.inactive_pane_hsb = {
	brightness = 0.35,
}

config.enable_tab_bar = false
config.native_macos_fullscreen_mode = true
config.disable_default_key_bindings = true

config.keys = {
	-- clipboard
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	-- front size
	{ key = "=", mods = "SUPER", action = act.IncreaseFontSize },
	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	{ key = "0", mods = "SUPER", action = act.ResetFontSize },
	-- search scrollback
	{ key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },
	-- fullscreen
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	-- new OS window
	{ key = "n", mods = "SUPER", action = act.SpawnWindow },
	-- tmux passthrough
	{ key = "t", mods = "SUPER", action = act.SendString("\x01t") },
	{ key = "w", mods = "SUPER", action = act.SendString("\x01w") },
	{ key = "Tab", mods = "CTRL", action = act.SendString("\x01\t") },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.SendString("\x01\x1b[Z") },
}

return config
