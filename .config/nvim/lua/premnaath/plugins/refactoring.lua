-- The Refactoring library based off the Refactoring book by Martin Fowler
local M = {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    },
}

M.config = function()
    require("refactoring").setup({})
end

return M