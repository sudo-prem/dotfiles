-- Lua written theme w/ good support for plugins
local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm",
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	},
}

M.config = function(_, opts)
	vim.cmd.colorscheme("tokyonight")
	local tokyonight = require("tokyonight")
	tokyonight.setup(opts)
	tokyonight.load()
end

return M