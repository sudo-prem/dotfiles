-- Make tokyonight transparent
local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "moon",
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "normal",
		},
	},
}

return M
