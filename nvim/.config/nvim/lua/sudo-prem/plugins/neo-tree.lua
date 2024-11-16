return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      popup_border_style = 'rounded',
      window = {
        position = 'right',
        width = 42,
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        group_empty_dirs = true,
        window = {
          fuzzy_finder_mappings = {
            ['<C-j>'] = 'move_cursor_down',
            ['<C-k>'] = 'move_cursor_up',
          },
        },
      },
      buffers = {
        follow_current_file = {
          leave_dirs_open = true,
        },
        group_empty_dirs = true,
      },
    }
    vim.cmd [[nnoremap \ :Neotree filesystem reveal toggle<CR>]]
  end,
}


