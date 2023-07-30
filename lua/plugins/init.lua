return {
    {
          "nvim-tree/nvim-tree.lua",
          version = "*",
          dependencies = {
            "nvim-tree/nvim-web-devicons",
          },
          config = function()
            require("nvim-tree").setup {}
          end,
    },
     'nvim-lua/plenary.nvim',
     'mbbill/undotree',
     'tpope/vim-fugitive',
     'lewis6991/gitsigns.nvim',
     'joosepalviste/nvim-ts-context-commentstring',

    -- telescope
     {'nvim-telescope/telescope.nvim' ,dependencies= 'nvim-lua/plenary.nvim' },
     { "nvim-telescope/telescope-file-browser.nvim" },
     'nvim-telescope/telescope-media-files.nvim',

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter'},

    -- lsp
     {
      'vonheikemen/lsp-zero.nvim',
      branch = 'v1.x',
      dependencies = {
        -- lsp support
        {'neovim/nvim-lspconfig'},             -- required
        {'williamboman/mason.nvim'},           -- optional
        {'williamboman/mason-lspconfig.nvim'}, -- optional

        -- autocompletion
        {'hrsh7th/nvim-cmp'},         -- required
        {'hrsh7th/cmp-nvim-lsp'},     -- required
        {'hrsh7th/cmp-buffer'},       -- optional
        {'hrsh7th/cmp-path'},         -- optional
        {'saadparwaiz1/cmp_luasnip'}, -- optional
        {'hrsh7th/cmp-nvim-lua'},     -- optional
        {'onsails/lspkind.nvim'},     -- optional

        -- snippets
        {'l3mon4d3/luasnip'},             -- required
        {'rafamadriz/friendly-snippets'}, -- optional

      }
    },

    -- markdown preview (in the terminal)
     -- {"ellisonleao/glow.nvim", config = function() require("glow").setup() end},

    -- latex
     -- 'lervag/vimtex',
     -- 'barreiroleo/ltex_extra.nvim',
     -- 'latex-lsp/tree-sitter-latex',

    -- -- quarto support
     -- { 'quarto-dev/quarto-nvim',
     --    dependencies = {
     --      'jmbuhr/otter.nvim',
     --      'neovim/nvim-lspconfig'
     --    },
     --  },

    --  { 
    --     'quarto-dev/quarto-nvim',
    --     version = '0.7.3',
    --     dependencies = {
    --       { 'hrsh7th/nvim-cmp' },
    --       {
    --         'jmbuhr/otter.nvim',
    --         version = '0.8.1',
    --         config = function()
    --           require 'otter.config'.setup {
    --             lsp = {
    --               hover = {
    --                 border = require 'misc.style'.border
    --               }
    --             }
    --           }
    --         end,
    --         }
    --     }
    -- },

     { 'theprimeagen/harpoon' },

    -- jupyter support
     { "kiyoon/jupynium.nvim", build = "pip3 install --user ." },

    ---- to cycle through tmux and vim panes with the same keybings 
   -- ({
   --      "aserowy/tmux.nvim",
   --      config = function() return require("tmux").setup() end
   --  })

}
