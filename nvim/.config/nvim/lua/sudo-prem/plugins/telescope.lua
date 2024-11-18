return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-l>"] = actions.select_default,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    file_ignore_patterns = { "node_modules", ".venv" },
                    hidden = true,
                },
                buffers = {
                    sort_last_used = true,
                    mappings = {
                        n = {
                            ["d"] = actions.delete_buffer,
                            ["l"] = actions.select_default,
                        },
                    },
                },
            },
            live_grep = {
                file_ignore_patterns = { "node_modules", ".venv" },
                additional_args = function(_)
                    return { "--hidden" }
                end,
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(
                require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, {})
    end,
}
