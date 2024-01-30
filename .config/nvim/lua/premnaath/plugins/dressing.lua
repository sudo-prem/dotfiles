local M = {
  "stevearc/dressing.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {},
  
}

M.config = function()
  require("dressing").setup()
end

return M