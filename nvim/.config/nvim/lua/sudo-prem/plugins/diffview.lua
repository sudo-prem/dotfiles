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
        vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
    end,
}
