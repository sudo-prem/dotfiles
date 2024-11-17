local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require('sudo-prem.plugins.tokyonight'),
  require('sudo-prem.plugins.alpha'),
  require('sudo-prem.plugins.lualine'),
  require('sudo-prem.plugins.nvim-tree'),
  require('sudo-prem.plugins.bufferline'),
  require('sudo-prem.plugins.telescope'),
  require('sudo-prem.plugins.treesitter'),
  require('sudo-prem.plugins.lsp'),
  require('sudo-prem.plugins.autocompletion'),
  require('sudo-prem.plugins.none-ls'),
  require('sudo-prem.plugins.leap'),
  require('sudo-prem.plugins.gitsigns'),
  require 'sudo-prem.plugins.indent-blankline',
  require('sudo-prem.plugins.nvim-surround'),
  require('sudo-prem.plugins.nvim-autopairs'),
  require('sudo-prem.plugins.todo-comments'),
  require('sudo-prem.plugins.vim-sleuth'),
}, {
  change_detection = { notify = false },
  checker = { enabled = false },
  defaults = {
    lazy = false,
    version = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwplugin",
        "tarplugin",
        "tohtml",
        "tutor",
        "zipplugin",
      },
    },
  },
})
