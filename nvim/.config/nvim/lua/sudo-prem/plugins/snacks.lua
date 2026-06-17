---@module "snacks"
require("snacks").setup({
	picker = {
		sources = {
			explorer = {
				layout = { layout = { position = "right" } },
				hidden = true,
				ignored = true,
			},
		},
		win = {
			input = {
				keys = {
					["<c-h>"] = { "preview_scroll_left", mode = { "i", "n" } },
					["<c-l>"] = { "preview_scroll_right", mode = { "i", "n" } },
				},
			},
			preview = {
				keys = {
					["<c-h>"] = "preview_scroll_left",
					["<c-l>"] = "preview_scroll_right",
				},
			},
		},
	},
	input = {},
	bufdelete = {},
	indent = {},
	scroll = {},
})

-- Was the lazy.nvim `keys = {...}` table; defined directly since snacks is eager-loaded.
local map = function(lhs, rhs, desc, mode, opts)
	opts = vim.tbl_extend("force", { desc = desc }, opts or {})
	vim.keymap.set(mode or "n", lhs, rhs, opts)
end

-- Bufdelete
map("<leader>x", function()
	Snacks.bufdelete()
end, "Close file")

-- Top Pickers & Explorer
map("<leader><space>", function()
	Snacks.picker.files({ hidden = true, ignored = false })
end, "Find Files")
map("<leader>,", function()
	Snacks.picker.buffers()
end, "Buffers")
map("<leader>/", function()
	Snacks.picker.grep()
end, "Grep")
map("<leader>:", function()
	Snacks.picker.command_history()
end, "Command History")
map("<leader>n", function()
	Snacks.picker.notifications()
end, "Notification History")
map("<A-e>", function()
	Snacks.explorer()
end, "File Explorer", { "n", "i" })

-- find
map("<leader>fb", function()
	Snacks.picker.buffers()
end, "Buffers")
map("<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, "Find Config File")
map("<leader>ff", function()
	Snacks.picker.files()
end, "Find Files")
map("<leader>fg", function()
	Snacks.picker.git_files()
end, "Find Git Files")
map("<leader>fp", function()
	Snacks.picker.projects()
end, "Projects")
map("<leader>fr", function()
	Snacks.picker.recent()
end, "Recent")

-- git
map("<leader>gb", function()
	Snacks.picker.git_branches()
end, "Git Branches")
map("<leader>gl", function()
	Snacks.picker.git_log()
end, "Git Log")
map("<leader>gL", function()
	Snacks.picker.git_log_line()
end, "Git Log Line")
map("<leader>gs", function()
	Snacks.picker.git_status()
end, "Git Status")
map("<leader>gS", function()
	Snacks.picker.git_stash()
end, "Git Stash")
map("<leader>gd", function()
	Snacks.picker.git_diff()
end, "Git Diff (Hunks)")
map("<leader>gf", function()
	Snacks.picker.git_log_file()
end, "Git Log File")

-- Grep
map("<leader>sB", function()
	Snacks.picker.grep_buffers()
end, "Grep Open Buffers")
map("<leader>sg", function()
	Snacks.picker.grep()
end, "Grep")
map("<leader>sw", function()
	Snacks.picker.grep_word()
end, "Visual selection or word", { "n", "x" })

-- search
map('<leader>s"', function()
	Snacks.picker.registers()
end, "Registers")
map("<leader>s/", function()
	Snacks.picker.search_history()
end, "Search History")
map("<leader>sa", function()
	Snacks.picker.autocmds()
end, "Autocmds")
map("<leader>sb", function()
	Snacks.picker.lines()
end, "Buffer Lines")
map("<leader>sc", function()
	Snacks.picker.command_history()
end, "Command History")
map("<leader>sC", function()
	Snacks.picker.commands()
end, "Commands")
map("<leader>sd", function()
	Snacks.picker.diagnostics()
end, "Diagnostics")
map("<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, "Buffer Diagnostics")
map("<leader>sh", function()
	Snacks.picker.help()
end, "Help Pages")
map("<leader>sH", function()
	Snacks.picker.highlights()
end, "Highlights")
map("<leader>si", function()
	Snacks.picker.icons()
end, "Icons")
map("<leader>sj", function()
	Snacks.picker.jumps()
end, "Jumps")
map("<leader>sk", function()
	Snacks.picker.keymaps()
end, "Keymaps")
map("<leader>sl", function()
	Snacks.picker.loclist()
end, "Location List")
map("<leader>sm", function()
	Snacks.picker.marks()
end, "Marks")
map("<leader>sM", function()
	Snacks.picker.man()
end, "Man Pages")
map("<leader>sp", function()
	Snacks.picker.lazy()
end, "Search for Plugin Spec")
map("<leader>sq", function()
	Snacks.picker.qflist()
end, "Quickfix List")
map("<leader>sR", function()
	Snacks.picker.resume()
end, "Resume")
map("<leader>su", function()
	Snacks.picker.undo()
end, "Undo History")
map("<leader>uC", function()
	Snacks.picker.colorschemes()
end, "Colorschemes")

-- LSP
map("gd", function()
	Snacks.picker.lsp_definitions()
end, "Goto Definition")
map("gD", function()
	Snacks.picker.lsp_declarations()
end, "Goto Declaration")
map("gr", function()
	Snacks.picker.lsp_references()
end, "References", "n", { nowait = true })
map("gI", function()
	Snacks.picker.lsp_implementations()
end, "Goto Implementation")
map("gy", function()
	Snacks.picker.lsp_type_definitions()
end, "Goto T[y]pe Definition")
map("<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, "LSP Symbols")
map("<leader>sS", function()
	Snacks.picker.lsp_workspace_symbols()
end, "LSP Workspace Symbols")
