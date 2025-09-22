local buffer_write_group = vim.api.nvim_create_augroup("BufferWriteGroup", {})
local yank_group = vim.api.nvim_create_augroup("YankGroup", {})
local text_file_group = vim.api.nvim_create_augroup("TextFileGroup", {})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = buffer_write_group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = text_file_group,
	pattern = { "text", "markdown", "tex", "plaintex", "rst", "org" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.showbreak = "↪ "
	end,
})

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev QA qa
]])
