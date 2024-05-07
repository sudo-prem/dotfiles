-- support lazydocker inside neovim
local M = {
	"crnvl96/lazydocker.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

return M
