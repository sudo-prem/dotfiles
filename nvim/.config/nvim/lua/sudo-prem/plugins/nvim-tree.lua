return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local api = require("nvim-tree.api")
        local HEIGHT_RATIO = 0.7
        local WIDTH_RATIO = 0.35
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
            disable_netrw = true,
            hijack_netrw = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            view = {
                float = {
                    enable = true,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get()
                            - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                            - vim.opt.cmdheight:get()
                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
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
        })

        vim.api.nvim_set_keymap(
            "n",
            "\\",
            ":NvimTreeToggle<cr>",
            { silent = true, noremap = true }
        )
    end,
}
