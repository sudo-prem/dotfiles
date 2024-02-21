-- Access lorem ipsum as a snippet
local M = {
	"derektata/lorem.nvim",
}

M.config = function()
	local lorem = require("lorem")
	lorem.setup({
		sentenceLength = "mixedShort",
		comma = 1,
	})
end

return M