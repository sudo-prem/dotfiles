return {
    "sindrets/diffview.nvim",
    config = function()
        require("diffview").setup({
            file_panel = {
                win_config = {
                    position = "right",
                    width = 42,
                    win_opts = {},
                },
            },
        })
        vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
        vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
        vim.keymap.set("n", "<leader>dh", ":DiffviewFileHistory %<CR>")
        vim.keymap.set("n", "|", ":DiffviewToggleFiles<CR>")
    end,
}
