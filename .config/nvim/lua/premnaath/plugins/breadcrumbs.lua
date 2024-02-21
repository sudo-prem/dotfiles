-- Improve the default vim.ui interfaces
local M = {
	"LunarVim/breadcrumbs.nvim",
}

M.config = function()
	require("breadcrumbs").setup()
end

return M