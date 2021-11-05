require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-omni'
    use 'saadparwaiz1/cmp_luasnip'
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'onsails/lspkind-nvim'
    use 'mfussenegger/nvim-jdtls'

    use 'ray-x/go.nvim'

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'

    use 'hoob3rt/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'folke/tokyonight.nvim'

    use 'kyazdani42/nvim-tree.lua'

    use 'iamcco/markdown-preview.nvim'

    use 'steelsojka/pears.nvim'

    use 'h4kuy4/Quick_comment'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'romgrk/nvim-treesitter-context'

    use 'lukas-reineke/indent-blankline.nvim'
end)

require ('plugin/status_line')
require ('plugin/autocmp')
require ('plugin/lsp')
require ('plugin/markdown_preview')
require ('plugin/treesitter')
require ('plugin/indentline')
require ('plugin/daps')
require ('plugin/snippets')
require ('plugin/filetree')

require ('pears').setup()
require ('quick_comment').setup()
-- require ('plugin/quick_comment')
