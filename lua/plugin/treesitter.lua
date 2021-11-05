require ('nvim-treesitter.configs').setup {
    ensure_installed = {},
    gnore_install = {},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'rn',
            },
        },
    },
}

require ('treesitter-context').setup{
    enable = true,
    throttle = true,
    max_lines = 0,
    patterns = {
        default = {
            'class',
            'function',
            'method',
        },
    },
}
