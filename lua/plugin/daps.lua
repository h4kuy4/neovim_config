local dap = require ('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<space>tb', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>co', '<cmd>lua require\'dap\'.continue()', opts)
vim.api.nvim_set_keymap('n', '<space>so', '<cmd>lua require\'dap\'.', opts)
vim.api.nvim_set_keymap('n', '<space>si', '<cmd>lua require\'dap\'.', opts)
vim.api.nvim_set_keymap('n', '<space>re', '<cmd>lua require\'dap\'.', opts)

--- DAP Virtual Text ---
vim.g.dap_virtual_text = true

--- DAP UI ---
require ('dapui').setup{
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
    },
    sidebar = {
        elements = {
            { id = "scopes",size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
}

