return {
    "MagicDuck/grug-far.nvim",
    config = function()
        require("grug-far").setup({
            windowCreationCommand = "70 vsplit",
            keymaps = {
                close = { n = "<localleader>rc" },
                swapReplacementInterpreter = { n = "<localleader>R" },
            },
        })
        vim.keymap.set(
            "n",
            "<leader>ro",
            ":GrugFar<CR>",
            { noremap = true, silent = true }
        )
    end,
}
