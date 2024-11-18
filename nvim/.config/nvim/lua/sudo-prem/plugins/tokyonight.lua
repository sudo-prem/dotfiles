return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "normal",
            },
        })
        vim.cmd("colorscheme tokyonight")
    end,
}
