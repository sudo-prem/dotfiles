local M = {
  "folke/neodev.nvim",
}

M.config = function()
  require("neodev").setup({
    library = { plugins = { "neotest" }, types = true },
  })
end

return M