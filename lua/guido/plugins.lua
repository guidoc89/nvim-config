vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }
    use 'folke/tokyonight.nvim' -- colorscheme
    use {'kyazdani42/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' } -- file tree
    use 'numToStr/Comment.nvim' -- commenting easily
    use 'nvim-lua/plenary.nvim' -- commenting easily
    use 'tpope/vim-surround' -- to easily surround selections with delimiters
    use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end } -- to easily surround selections with delimiters
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    -- Lualine (statusline)
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Telescope
    use {'nvim-telescope/telescope.nvim' ,requires= 'nvim-lua/plenary.nvim' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run=':TSUpdate'})
    use('nvim-treesitter/playground')

    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional
        {'onsails/lspkind.nvim'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional

      }
    }

    -- Markdown preview (in a browser)
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    
    -- Markdown preview (in the terminal)
    use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

    -- Latex
    use 'lervag/vimtex'
    use 'barreiroleo/ltex_extra.nvim'
    use 'latex-lsp/tree-sitter-latex'

    -- Quarto support
    use { 'quarto-dev/quarto-nvim',
        requires = {
          'jmbuhr/otter.nvim',
          'neovim/nvim-lspconfig'
        },
      }

    -- Jupyter support
    use { "kiyoon/jupynium.nvim", run = "pip3 install --user ." }

    ---- To cycle through tmux and vim panes with the same keybings 
   -- use({
   --      "aserowy/tmux.nvim",
   --      config = function() return require("tmux").setup() end
   --  })

end
)

