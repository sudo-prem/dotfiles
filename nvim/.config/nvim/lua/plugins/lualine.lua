return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
      disabled_filetypes = {
        "DiffviewFiles",
      },
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      always_divide_middle = true,
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
  },
}
