vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
    use {'kyazdani42/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'}
    use 'neovim/nvim-lspconfig' --CHECK! (typescript)
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-compe' --CHECK!
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'folke/tokyonight.nvim'
    use 'numToStr/Comment.nvim'
    use "nvim-lua/plenary.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    --use 'MunifTanjim/eslint.nvim'
    use {
        'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } --CHECK!
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } --CHECK
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use 'tpope/vim-surround'
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use 'hrsh7th/nvim-cmp' --CHECk!
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/lspkind-nvim'
    use 'L3MON4D3/LuaSnip' --CHECK!
    use 'hrsh7th/cmp-buffer'
    use 'windwp/nvim-ts-autotag'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-telescope/telescope.nvim'
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'nvim-telescope/telescope-media-files.nvim'
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'glepnir/lspsaga.nvim'
    use {
        "williamboman/mason.nvim", --CHECK! (tailwind)
        "williamboman/mason-lspconfig.nvim", --CHECK! (tailwind)
    }
    use 'sumneko/lua-language-server'
    use 'MunifTanjim/prettier.nvim'
    use 'norcalli/nvim-colorizer.lua' --CHECK!(to see hexcode colors)
    use 'akinsho/toggleterm.nvim' --CHECK!(toggle terminal)
    use 'ryanoasis/vim-devicons'
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim'
    use { 'phaazon/hop.nvim', branch = 'v2', -- optional but strongly recommended
              config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
              end
}
    use "lukas-reineke/indent-blankline.nvim"
    -- Packer. Noice takes way too much memory
--     use({ "folke/noice.nvim",
--             config = function()
--             require("noice").setup()
--           end,
--           requires = {
--             -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--             "MunifTanjim/nui.nvim",
--             -- OPTIONAL:
--             --   `nvim-notify` is only needed, if you want to use the notification view.
--             --   If not available, we use `mini` as the fallback
--             "rcarriga/nvim-notify",
--         }
-- })
end
)
