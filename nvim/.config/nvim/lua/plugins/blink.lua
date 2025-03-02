return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
  },
}
