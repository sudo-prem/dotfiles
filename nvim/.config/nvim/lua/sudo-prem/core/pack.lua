local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add({
	-- UI
	{ src = gh("folke/tokyonight.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("nvim-tree/nvim-web-devicons") },
	-- Utilities
	{ src = gh("tpope/vim-sleuth") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = "https://codeberg.org/andyg/leap.nvim" },
	{ src = gh("echasnovski/mini.nvim") },
	{ src = gh("folke/snacks.nvim") },
	-- LSP / completion / treesitter
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("mason-org/mason-lspconfig.nvim") },
	{ src = gh("WhoIsSethDaniel/mason-tool-installer.nvim") },
	{ src = gh("j-hui/fidget.nvim") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
	{ src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2") },
	{ src = gh("folke/lazydev.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "master" },
})

-- order matters
require("sudo-prem.plugins.tokyonight")
require("sudo-prem.plugins.treesitter")
require("sudo-prem.plugins.lazydev")
require("sudo-prem.plugins.blink")
require("sudo-prem.plugins.nvim-lspconfig")
require("sudo-prem.plugins.conform")
require("sudo-prem.plugins.gitsigns")
require("sudo-prem.plugins.lualine")
require("sudo-prem.plugins.snacks")
require("sudo-prem.plugins.mini")
require("sudo-prem.plugins.leap")

-- plugin update UI
vim.keymap.set("n", "<leader>l", function()
	vim.pack.update()
end, { noremap = true, silent = true, desc = "Update plugins (vim.pack)" })
