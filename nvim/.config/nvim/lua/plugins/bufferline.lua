return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      max_name_length = 30,
      max_prefix_length = 30,
      tab_size = 21,
      separator_style = { "│", "│" },
      indicator = {
        style = "none",
      },
      offsets = {
        -- :set ft
        {
          filetype = "DiffviewFiles",
          highlight = "Directory",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
      minimum_padding = 1,
      maximum_padding = 5,
      maximum_length = 15,
    },
    highlights = {
      separator = {
        fg = "#434C5E",
      },
      buffer_selected = {
        bold = true,
        italic = false,
      },
    },
  },
}
