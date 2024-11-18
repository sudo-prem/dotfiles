return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
        },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "NvimTree",
                "Trouble",
            },
        },
    },
}
