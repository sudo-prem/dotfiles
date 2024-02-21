-- Notifications and LSP progress messages
local M = {
	"j-hui/fidget.nvim",
	branch = "legacy",
	enabled = false,
}

M.config = function()
	require("fidget").setup({
		window = { blend = 0 },
	})
end

return M