return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "moon",
			transparent = true,
			styles = {
				comments = { italic = false },
				sidebars = "transparent",
				floats = "normal",
			},
		})
		vim.cmd("colorscheme tokyonight")
	end,
}
