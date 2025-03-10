return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup(
                "sudo-lsp-attach",
                { clear = true }
            ),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(
                        mode,
                        keys,
                        func,
                        { buffer = event.buf, desc = "LSP: " .. desc }
                    )
                end
                map(
                    "gd",
                    require("telescope.builtin").lsp_definitions,
                    "[G]oto [D]efinition"
                )
                map(
                    "gr",
                    require("telescope.builtin").lsp_references,
                    "[G]oto [R]eferences"
                )
                map(
                    "gI",
                    require("telescope.builtin").lsp_implementations,
                    "[G]oto [I]mplementation"
                )
                map(
                    "<leader>D",
                    require("telescope.builtin").lsp_type_definitions,
                    "Type [D]efinition"
                )
                map(
                    "<leader>ds",
                    require("telescope.builtin").lsp_document_symbols,
                    "[D]ocument [S]ymbols"
                )
                map(
                    "<leader>ws",
                    require("telescope.builtin").lsp_dynamic_workspace_symbols,
                    "[W]orkspace [S]ymbols"
                )
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map(
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    "[C]ode [A]ction",
                    { "n", "x" }
                )
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client.supports_method(
                        vim.lsp.protocol.Methods.textDocument_documentHighlight
                    )
                then
                    local highlight_augroup = vim.api.nvim_create_augroup(
                        "sudo-lsp-highlight",
                        { clear = false }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorHold", "CursorHoldI" },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorMoved", "CursorMovedI" },
                        {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup(
                            "sudo-lsp-detach",
                            { clear = true }
                        ),
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

        if vim.g.have_nerd_font then
            local signs =
                { Error = "", Warn = "", Hint = "", Info = "" }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )
        local servers = {
            html = {},
            cssls = {},
            clangd = {},
            pyright = {},
            ts_ls = {},
            lua_ls = {
                capabilities = capabilities,
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
            },
        }

        require("mason").setup()
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            -- Linters
            "pylint",
            "eslint_d",
            -- Formatters
            "prettier",
            "stylua",
            "black",
        })

        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
        })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        vim.keymap.set(
            "n",
            "<leader>m",
            ":Mason<CR>",
            { noremap = true, silent = true }
        )
    end,
}
