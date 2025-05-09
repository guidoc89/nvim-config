return {

	"nvim-lua/plenary.nvim",
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},

	-- telescope
	{ "nvim-telescope/telescope.nvim", dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make"  },
        }
    },
	"nvim-telescope/telescope-media-files.nvim",

	-- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

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
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
            {
              "neovim/nvim-lspconfig",
              dependencies = { "saghen/blink.cmp" },
            },

			{ "onsails/lspkind.nvim" },

		},
	},

}
