return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "tokyonight",
                disabled_filetypes = {
                    "NvimTree",
                    "alpha",
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                always_divide_middle = true,
                refresh = {
                    statusline = 10,
                    tabline = 10,
                    winbar = 10,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
