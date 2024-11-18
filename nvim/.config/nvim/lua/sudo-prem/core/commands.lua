local sudo_group = vim.api.nvim_create_augroup("SudoGroup", {})
local yank_group = vim.api.nvim_create_augroup("YankGroup", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = sudo_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq
inoreabbrev dont don't
inoreabbrev youre you're
]])
