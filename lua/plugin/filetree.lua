-- local g = vim.bo

_G.nvim_tree_gitignore = 1
_G.nvim_tree_quit_on_open = 1
_G.nvim_tree_indent_markers = 1
_G.nvim_tree_git_hl = 1
_G.nvim_tree_highlight_opened_files = 1
_G.nvim_tree_root_folder_modifier = ':~'
_G.nvim_tree_add_trailing = 1
_G.nvim_tree_group_empty = 1
_G.nvim_tree_disable_window_picker = 1
_G.nvim_tree_icon_padding = ' '
_G.nvim_tree_symlink_arrow = ' >> '
_G.nvim_tree_respect_buf_cwd = 1
_G.nvim_tree_create_in_closed_folder = 0
_G.nvim_tree_refresh_wait = 500
_G.nvim_tree_window_picker_exclude = {
    filetype = {
        'notify',
        'packer',
        'qf'
    },
    buftype = {
        'terminal'
    }
}
_G.nvim_tree_special_files = {
    ['README.md'] = 1,
    ['Makefile']  = 1,
    ['MAKEFILE']  = 1
}
_G.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
    folder_arrows = 0,
}
_G.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
         arrow_closed = "",
         default= "",
         open = "",
         empty = "",
         empty_open = "",
         symlink = "",
         symlink_open = "",
    }
}

vim.api.nvim_set_keymap("n", "<C-t>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}
