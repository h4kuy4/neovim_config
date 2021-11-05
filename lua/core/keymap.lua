local map = vim.api.nvim_set_keymap
local noresilent = {noremap = true, silent = true}

map('n', '<S-w>', 'k', noresilent)
map('n', '<S-r>', 'j', noresilent)
map('n', '<S-a>', 'h', noresilent)
map('n', '<S-s>', 'l', noresilent)

map('n', '<C-w>', '10k', noresilent)
map('n', '<C-r>', '10j', noresilent)
map('n', '<C-a>', '10h', noresilent)
map('n', '<C-s>', '10l', noresilent)

map('n', '<A-w>', ':w<CR>', noresilent)
map('n', '<A-q>', ':q<CR>', noresilent)

map('n', '<Space>tc', ':tabc<CR>', noresilent)
map('n', '<Space>tn', ':tabn<CR>', noresilent)
map('n', '<Space>tp', ':tabp<CR>', noresilent)

map('n', '<Space>sh', ':sp<CR>' , noresilent)
map('n', '<Space>sv', ':vsp<CR>', noresilent)
map('n', '<A-w>'    , '<C-w>k'  , noresilent)
map('n', '<A-r>'    , '<C-w>j'  , noresilent)
map('n', '<A-a>'    , '<C-w>h'  , noresilent)
map('n', '<A-s>'    , '<C-w>l'  , noresilent)
