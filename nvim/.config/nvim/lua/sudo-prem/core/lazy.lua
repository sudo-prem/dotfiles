local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
	-- UI
	require("sudo-prem.plugins.tokyonight"),
	require("sudo-prem.plugins.lualine"),
	-- Utilities
	require("sudo-prem.plugins.vim-sleuth"),
	require("sudo-prem.plugins.gitsigns"),
	require("sudo-prem.plugins.leap"),
	require("sudo-prem.plugins.grug-far"),
	require("sudo-prem.plugins.mini"),
	require("sudo-prem.plugins.snacks"),
	-- LSP
	require("sudo-prem.plugins.nvim-lspconfig"),
	require("sudo-prem.plugins.conform"),
	require("sudo-prem.plugins.blink"),
	require("sudo-prem.plugins.treesitter"),
	require("sudo-prem.plugins.lazydev"),
	-- AI
	require("sudo-prem.plugins.opencode"),
})

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { noremap = true, silent = true })
