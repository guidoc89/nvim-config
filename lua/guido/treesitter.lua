-- From the Blog, for typescript
local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn,',
            node_incremental = 'grn',
            scope_incremental  = 'grc,',
            node_decremental = 'grm,'
        }
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {'python'},
    },
    autotag = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            -- keymaps = {
            --     ['af'] = '@function.outer',
            --     ['if'] = '@function.inner',
            --     ['ac'] = '@class.outer',
            --     ['ic'] = '@class.outer',
            -- }
        },
    },


    -- A list of parser names, or "all"
    -- ensure_installed = { "c", "lua", "rust", 'javascript', 'typescript', 'css', 'html', 'json', 'toml', 'yaml',
    --     'tsx', 'fish', 'php' ,
            -- 'python'
    -- },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    auto_tab = { enable = true },

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
