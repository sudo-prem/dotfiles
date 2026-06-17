-- LuaSnip (snippet engine; added in core/pack.lua, configured here before blink).
require("luasnip").setup({})

local snippets_path = vim.fn.stdpath("config") .. "/snippets"
require("luasnip.loaders.from_snipmate").load({ paths = { snippets_path } })
require("luasnip.loaders.from_lua").load({ paths = { snippets_path } })

--- @module 'blink.cmp'
--- @type blink.cmp.Config
require("blink.cmp").setup({
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
				return { "lsp", "path", "snippets", "buffer", "lazydev" }
			end
		end,
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
})
