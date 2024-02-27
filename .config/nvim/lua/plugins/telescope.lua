-- Find, Filter, Preview, Pick
local M = {
	"telescope.nvim",
	dependencies = {
		-- project management
		{
			"ahmedkhalf/project.nvim",
			opts = {
				manual_mode = true,
			},
			event = "VeryLazy",
			config = function(_, opts)
				require("project_nvim").setup(opts)
				require("lazyvim.util").on_load("telescope.nvim", function()
					require("telescope").load_extension("projects")
				end)
			end,
			keys = {
				{ "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
			},
		},
	},
}

M.config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
			},
		},
	})
end

return M
