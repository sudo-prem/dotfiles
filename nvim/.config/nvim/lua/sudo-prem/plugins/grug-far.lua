return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup({
            keymaps = {
                close = { n = "<localleader>rc" },
                swapReplacementInterpreter = { n = "<localleader>R" },
            },
        })
        vim.keymap.set(
            { "n", "v" },
            "<leader>ro",
            ":GrugFar<CR>",
            { noremap = true, silent = true }
        )
    end,
}
