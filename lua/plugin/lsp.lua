local lsp = require('lspconfig')

local cmp = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.pyright.setup {
    capabilities = cmp,
}

--lsp.ccls.setup {}
lsp.clangd.setup {
    capabilities = cmp,
    filetypes = {
        "cpp"
    },
    cmd = {
        "clangd",
        "--background-index",
        "-j=12",
        "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
    }
}

lsp.clangd.setup {
    capabilities = cmp,
    filetypes = {
        "c"
    },
    cmd = {
        "clangd",
        "--background-index",
        "-j=12",
        "--query-driver=/usr/bin/**/clang-*,/bin/clang,/usr/bin/gcc",
        "--clang-tidy",
        "--clang-tidy-checks=*",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
    }
}

lsp.sumneko_lua.setup {
    capabilities = cmp,
    cmd = {
        "lua-language-server"
    }
}
--[[
lsp.jdtls.setup {
    capabilities = cmp,
    cmd = {
        "jdtls"
    }
}
]]--

lsp.gopls.setup {}

lsp.java_language_server.setup {
    capabilities = cmp,
    cmd = {
        "/home/hakuya/Workplace/java-language-server/dist/lang_server_linux.sh",
    },
}

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

buf_set_keymap('n', 'gD'        , '<cmd>lua vim.lsp.buf.declaration()<CR>'                                  , opts)
buf_set_keymap('n', 'gd'        , '<cmd>lua vim.lsp.buf.definition()<CR>'                                   , opts)
buf_set_keymap('n', 'K'         , '<cmd>lua vim.lsp.buf.hover()<CR>'                                        , opts)
buf_set_keymap('n', 'gi'        , '<cmd>lua vim.lsp.buf.implementation()<CR>'                               , opts)
buf_set_keymap('n', '<C-k>'     , '<cmd>lua vim.lsp.buf.signature_help()<CR>'                               , opts)
buf_set_keymap('n', '<space>wa' , '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                         , opts)
buf_set_keymap('n', '<space>wr' , '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                      , opts)
buf_set_keymap('n', '<space>wl' , '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'   , opts)
buf_set_keymap('n', '<space>D'  , '<cmd>lua vim.lsp.buf.type_definition()<CR>'                              , opts)
buf_set_keymap('n', '<space>rn' , '<cmd>lua vim.lsp.buf.rename()<CR>'                                       , opts)
buf_set_keymap('n', '<space>ca' , '<cmd>lua vim.lsp.buf.code_action()<CR>'                                  , opts)
buf_set_keymap('n', 'gr'        , '<cmd>lua vim.lsp.buf.references()<CR>'                                   , opts)
buf_set_keymap('n', '<space>e'  , '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'                 , opts)
buf_set_keymap('n', '[d'        , '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'                             , opts)
buf_set_keymap('n', ']d'        , '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'                             , opts)
buf_set_keymap('n', '<space>q'  , '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'                           , opts)
buf_set_keymap('n', '<space>f'  , '<cmd>lua vim.lsp.buf.formatting()<CR>'                                   , opts)

-- Save after formatting.
vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]

require('go').setup({
    goimport='gopls', -- goimport command, can be gopls[default] or goimport
    gofmt = 'gofumpt', --gofmt cmd,
    max_line_len = 120, -- max line length in goline format
    tag_transform = false, -- tag_transfer  check gomodifytags for details
    test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
    test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
    comment_placeholder = '' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
    icons = {breakpoint = '🧘', currentpos = '🏃'},
    verbose = false,  -- output loginf in messages
    lsp_cfg = false, -- true: apply go.nvim non-default gopls setup, if it is a list, will merge with gopls setup e.g.
                   -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
    lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
    lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
                       -- true: will use go.nvim on_attach if true
                       -- nil/false do nothing
    lsp_codelens = true, -- set to false to disable codelens, true by default
    gopls_remote_auto = true, -- add -remote=auto to gopls
    gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile",
    fillstruct = {
        'gopls', -- can be nil (use fillstruct, slower) and gopls
        "/var/log/gopls.log" 
    },
    lsp_diag_hdlr = true, -- hook lsp diag handler
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = true, -- set keymaps for debugger
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
})
--[[
if vim.bo.filetype == "java" then
    local project_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

    require ('jdtls').start_or_attach {
        cmd = {
            'java',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-data', '/home/hakuya/Workplace/java'..project_dir,
            '-Dawt.useSystemAAFontSettings=on',
            '-Dswing.aatext=true',
        },
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        init_options = {
            bundles = {
                vim.fn.glob("/home/hakuya/Workplace/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
                vim.split(vim.fn.glob("/home/hakuya/Workplace/java/vscode-java-test/server/*.jar"), "\n"),
            },
        },
        on_attach = function (client, bufnr)
            require ('jdtls').setup_dap({
                hotcodereplace = 'auto',
            })
        end
    }

    buf_set_keymap('n', '<space>ca' , '<cmd>lua require(\'jdtls\').code_action()<CR>'                   , opts)
    buf_set_keymap('n', '<space>car', '<cmd>lua require(\'jdtls\').code_action(false, \'rafactor\')<CR>', opts)
    buf_set_keymap('n', '<space>oi' , '<cmd>lua require(\'jdtls\').organize_imports()<CR>'              , opts)
    buf_set_keymap('n', '<space>ev' , '<cmd>lua require(\'jdtls\').extract_variable()<CR>'              , opts)
    buf_set_keymap('n', '<space>ec' , '<cmd>lua require(\'jdtls\').extract_constant()<CR>'              , opts)
    buf_set_keymap('n', '<space>em' , '<cmd>lua require(\'jdtls\').extract_method()<CR>'                , opts)
    buf_set_keymap('n', '<space>tc' , '<cmd>lua require(\'jdtls\').test_class()<CR>'                    , opts)
    buf_set_keymap('n', '<space>tm' , '<cmd>lua require(\'jdtls\').test_nearest_method()<CR>'           , opts)
    buf_set_keymap('v', '<space>ca' , '<esc><cmd>lua require(\'jdtls\').code_action(true)<CR>'          , opts)
    buf_set_keymap('v', '<space>ev' , '<esc><cmd>lua require(\'jdtls\').<extract_variable(true)CR>'     , opts)
    buf_set_keymap('v', '<space>ec' , '<esc><cmd>lua require(\'jdtls\').<extract_constant(true)CR>'     , opts)
    buf_set_keymap('v', '<space>em' , '<esc><cmd>lua require(\'jdtls\').<extract_method(true)CR>'       , opts)

    vim.api.nvim_command("command! -buffer JdtCompile lua require('jdtls').compile()")
    vim.api.nvim_command("command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()")
    vim.api.nvim_command("command! -buffer JdtJol lua require('jdtls').jol()")
    vim.api.nvim_command("command! -buffer JdtBytecode lua require('jdtls').javap()")
    vim.api.nvim_command("command! -buffer JdtJshell lua require('jdtls').jshell()")
end
]]--
