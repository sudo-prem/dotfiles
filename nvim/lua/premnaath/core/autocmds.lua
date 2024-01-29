local api = vim.api

-- stop auto commenting new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- get all new updates when entering a buffer
api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- highlight yanked
api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 70 }
  end,
})

-- resize neovim split when terminal is resized
api.nvim_command("autocmd VimResized * wincmd =")

