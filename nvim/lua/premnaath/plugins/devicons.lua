local devicons = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function devicons.config()
  require "nvim-web-devicons"
end

return devicons
