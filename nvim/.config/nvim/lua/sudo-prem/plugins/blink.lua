return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			-- dependencies = {
			-- 	{
			-- 		"rafamadriz/friendly-snippets",
			-- 		config = function()
			-- 			require("luasnip.loaders.from_vscode").lazy_load()
			-- 		end,
			-- 	},
			-- },
			opts = {},
			config = function()
				require("luasnip.loaders.from_lua").load({
					paths = {
						"~/dotfiles/nvim/.config/nvim/snippets",
					},
				})
			end,
		},
		"folke/lazydev.nvim",
	},

	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		sources = {
			default = function()
				if vim.bo.filetype == "cpp" then
					return { "snippets" }
				else
					return { "lsp", "path", "snippets", "buffer" }
				end
			end,
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
			},
		},
		snippets = { preset = "luasnip" },
		fuzzy = { implementation = "lua" },
		signature = { enabled = true },
	},
}
