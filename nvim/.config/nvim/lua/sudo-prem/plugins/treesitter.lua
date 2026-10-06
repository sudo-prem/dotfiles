local parsers = {
	"json",
	"javascript",
	"typescript",
	"tsx",
	"yaml",
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"sql",
	"toml",
	"dockerfile",
}

local treesitter = require("nvim-treesitter")

treesitter.setup({})
treesitter.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("sudo-treesitter", { clear = true }),
	callback = function(ev)
		if pcall(vim.treesitter.start, ev.buf) then
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

vim.keymap.set({ "n", "x" }, "<C-space>", function()
	vim.treesitter.select("parent")
end, { desc = "Increment Treesitter selection" })

vim.keymap.set("x", "<BS>", function()
	vim.treesitter.select("child")
end, { desc = "Decrement Treesitter selection" })
