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
        vim.keymap.set(
            "n",
            "<leader>do",
            ":DiffviewOpen<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>dc",
            ":DiffviewClose<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>dh",
            ":DiffviewFileHistory %<CR>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "|",
            ":DiffviewToggleFiles<CR>",
            { noremap = true, silent = true }
        )
    end,
}
