local buffer_write_group = vim.api.nvim_create_augroup("BufferWriteGroup", {})
local yank_group = vim.api.nvim_create_augroup("YankGroup", {})

vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("sudo-pack-build", { clear = true }),
	callback = function(ev)
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end
		if ev.data.spec.name == "nvim-treesitter" then
			-- :TSUpdate needs the plugin loaded; on a fresh install it may not be yet.
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

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

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev QA qa
]])
