return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        require("nvim-tree").setup({
            on_attach = function(bufnr)
                local opts = { buffer = bufnr }
                api.config.mappings.default_on_attach(bufnr)
                local close_parent_node = function()
                    local node_at_cursor = api.tree.get_node_under_cursor()
                    if node_at_cursor.nodes and node_at_cursor.open then
                        api.node.open.edit()
                    else
                        api.node.navigate.parent()
                        api.node.open.edit()
                    end
                end
                vim.keymap.set("n", "h", close_parent_node, opts)
                vim.keymap.set("n", "l", function()
                    api.node.open.edit()
                end, opts)
                vim.keymap.set("n", "i", function()
                    api.node.show_info_popup()
                end, opts)
                vim.keymap.set("n", ".", function()
                    api.tree.change_root_to_node()
                end, opts)
            end,
            view = {
                debounce_delay = 10,
                side = "right",
                width = 42,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    git_placement = "after",
                },
            },
            update_focused_file = {
                enable = true,
            },
            git = {
                ignore = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
        vim.api.nvim_set_keymap(
            "n",
            "\\",
            ":NvimTreeToggle<cr>",
            { silent = true, noremap = true }
        )
    end,
}
