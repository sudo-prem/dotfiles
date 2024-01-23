local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function treesitter.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "vimdoc", "javascript", "typescript", "cpp", "lua", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
  }
end

return treesitter
