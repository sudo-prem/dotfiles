vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("sudo-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("sudo-lsp-highlight", { clear = false })

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("sudo-lsp-detach", { clear = true }),
				callback = function(current_event)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({
						group = "sudo-lsp-highlight",
						buffer = current_event.buf,
					})
				end,
			})
		end
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

-- LSP progress notifications (was a lazy.nvim dependency with `opts = {}`).
require("fidget").setup({})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Capabilities applied to every server via the lowest-priority "*" config
-- (Neovim 0.11+ native LSP; deep-merged into each server at resolve time).
vim.lsp.config("*", { capabilities = capabilities })

-- Only servers that need real settings get a named config. Bare servers (html,
-- cssls, clangd, pyright, ts_ls) need no vim.lsp.config call: they inherit "*"
-- plus nvim-lspconfig's shipped defaults and are turned on by automatic_enable.
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

require("mason").setup()

require("mason-tool-installer").setup({
	-- lspconfig names work here because mason-tool-installer's default
	-- 'mason-lspconfig' integration translates them to Mason package names.
	ensure_installed = {
		-- Servers
		"html",
		"cssls",
		"clangd",
		"pyright",
		"ts_ls",
		"lua_ls",
		-- Linters
		"pylint",
		"eslint_d",
		"swiftlint",
		-- Formatters
		"prettier",
		"stylua",
		"black",
	},
})

-- Not a mason-managed server; configure and enable it explicitly.
vim.lsp.config("sourcekit", {
	cmd = { "/usr/bin/sourcekit-lsp" },
	capabilities = capabilities,
})
vim.lsp.enable("sourcekit")

-- mason-lspconfig v2 dropped `handlers`/`automatic_installation`. `automatic_enable`
-- (on by default) runs `vim.lsp.enable()` for every mason-installed server, which
-- replaces the old per-server handler.
require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_enable = true,
})

vim.keymap.set("n", "<leader>m", ":Mason<CR>", { noremap = true, silent = true })
