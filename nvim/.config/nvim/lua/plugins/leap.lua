return {
  "ggandor/leap.nvim",
  config = function()
    vim.keymap.set({ "n", "x" }, "f", "<Plug>(leap)")
  end,
}
