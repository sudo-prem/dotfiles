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
    -- ui
    require("sudo-prem.plugins.tokyonight"),
    require("sudo-prem.plugins.alpha"),
    require("sudo-prem.plugins.lualine"),
    require("sudo-prem.plugins.bufferline"),
    require("sudo-prem.plugins.dressing"),
    require("sudo-prem.plugins.todo-comments"),
    -- util
    require("sudo-prem.plugins.gitsigns"),
    require("sudo-prem.plugins.nvim-tree"),
    require("sudo-prem.plugins.telescope"),
    require("sudo-prem.plugins.leap"),
    require("sudo-prem.plugins.indent-blankline"),
    require("sudo-prem.plugins.nvim-surround"),
    require("sudo-prem.plugins.nvim-autopairs"),
    require("sudo-prem.plugins.vim-sleuth"),
    require("sudo-prem.plugins.diffview"),
    -- lsp
    require("sudo-prem.plugins.nvim-lspconfig"),
    require("sudo-prem.plugins.conform"),
    require("sudo-prem.plugins.nvim-cmp"),
    require("sudo-prem.plugins.treesitter"),
})

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })
