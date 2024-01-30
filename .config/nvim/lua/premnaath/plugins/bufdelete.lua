local M = {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
}

M.config = function()
  vim.keymap.set(
    "n",
    "Q",
    ":lua require('bufdelete').bufdelete(0, false)<cr>",
    { noremap = true, silent = true, desc = "Delete buffer" }
  )
end

return M