return {

	"nvim-lua/plenary.nvim",
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	-- {     "JoosepAlviste/nvim-ts-context-commentstring", config= },

	-- telescope
	{ "nvim-telescope/telescope.nvim", dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make"  },
        }
    },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	"nvim-telescope/telescope-media-files.nvim",
    -- colorschemes,
 	"rktjmp/lush.nvim",

	-- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      -- "matthewmazzanti/nvim-ts-autotag",
    },
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "json",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "prisma",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "query",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = {
        --   enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },

	-- lsp
	{
		"vonheikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- lsp support
			{ "neovim/nvim-lspconfig" }, -- required
			{ "williamboman/mason.nvim" }, -- optional
			{ "williamboman/mason-lspconfig.nvim" }, -- optional

			-- autocompletion
			{ "hrsh7th/nvim-cmp" }, -- required
			{ "hrsh7th/cmp-nvim-lsp" }, -- required
			{ "hrsh7th/cmp-buffer" }, -- optional
			{ "hrsh7th/cmp-path" }, -- optional
			{ "saadparwaiz1/cmp_luasnip" }, -- optional
            { "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lua" }, -- optional
			{ "onsails/lspkind.nvim" }, -- optional

			-- snippets
			{ "l3mon4d3/luasnip" }, -- required
			{ "rafamadriz/friendly-snippets" }, -- optional
		},
	},

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

	---- to cycle through tmux and vim panes with the same keybings
	-- ({
	--      "aserowy/tmux.nvim",
	--      config = function() return require("tmux").setup() end
	--  })
}
