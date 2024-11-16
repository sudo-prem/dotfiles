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
        width = 35,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<esc>'] = 'cancel',
          ['P'] = { 'toggle_preview', config = { use_float = false } },
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['t'] = 'open_tabnew',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ["c"] = {
            "copy",
            config = {
              show_path = "absolute"
            }
          },
          ['m'] = 'move',
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['i'] = 'show_file_details',
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = false,
        window = {
          mappings = {
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['H'] = 'toggle_hidden',
            ['/'] = 'fuzzy_finder',
            ['D'] = 'fuzzy_finder_directory',
            ['f'] = '',
            ['[g'] = 'prev_git_modified',
            [']g'] = 'next_git_modified',
          },
          fuzzy_finder_mappings = {
            ['<down>'] = 'move_cursor_down',
            ['<C-j>'] = 'move_cursor_down',
            ['<up>'] = 'move_cursor_up',
            ['<C-k>'] = 'move_cursor_up',
          },
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = true,
        window = {
          mappings = {
            ['bd'] = 'buffer_delete',
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
          },
        },
      },
    }
    vim.cmd [[nnoremap \ :Neotree filesystem reveal toggle right<CR>]]
  end,
}


