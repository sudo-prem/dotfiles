local buffer_write_group = vim.api.nvim_create_augroup("BufferWriteGroup", {})
local yank_group = vim.api.nvim_create_augroup("YankGroup", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 50,
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = buffer_write_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev QA qa
]])
