local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	---@class NoiceConfig
	opts = {
		---@type NoicePresets
		presets = {
			inc_rename = true,
		},
		---@type NoiceConfigViews
		views = {
			cmdline_popup = {
				position = {
					row = 7,
					col = "55%",
				},
			},
			cmdline_popupmenu = {
				position = {
					row = 7,
					col = "55%",
				},
			},
		},
	},
}

return M
