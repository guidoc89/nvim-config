-- VSCode-like icons
local kind_icons = {
             Text=           '',
             Function=      '',
             Method=       '',
             Constructor=   '',
             Field=         '',
             Variable=      '',
             Class=         '',
             Interface=    '',
             Module=        '',
             Property=     '',
             Unit=          '',
             Value=         '',
             Enum=          '',
             Keyword=       '',
             Snippet=       '',
             Color=         '',
             File=          '',
             Reference=     '',
             Folder=        '',
             EnumMember=    '',
             Constant=      '',
             Struct=        '',
             Event=         '',
             Operator=      '',
             TypeParameter= '',
}


local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

--
lsp.ensure_installed({
    'tsserver',
    'eslint',
    --'lua-language-server',
    'rust_analyzer',
    'pyright',
    'html',
    'jsonls',
    'cssls',
    -- 'r_language_server',
    'tailwindcss',
})

local lspkind = require('lspkind')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-space>'] = cmp.mapping.complete() ,
})

lsp.setup_nvim_cmp({
      sources = {
            {name = 'path'},
            {name = 'nvim_lsp', keyword_length = 1},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
            {name = 'otter'},
            {name = 'latex'},
  },
    mapping = cmp_mappings,
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = lspkind.cmp_format {
            mode = 'text_symbol',
            max_width = 50,
                      -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            local shorten_abbr = string.sub(vim_item.abbr, 1, 30)
                if shorten_abbr ~= vim_item.abbr then vim_item.abbr = shorten_abbr .. "..." end
            -- Kind icons
                -- TODO: disabled the line to try to get rid of the squares to the sides of the current line (THIS ISNT THE CAUSE)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            -- Source
            vim_item.menu = ({
              buffer = "[Buf]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[API]",
              latex_symbols = "[LaTeX]",
              cmp_tabnine = "[Tabnine]",
              path = "[Path]",
              otter = "[Quarto]",
              -- emoji = "[Emoji]",
            })[entry.source.name]
            return vim_item
          end,
        },
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- (Optional) Configure lua language server for neovim
--lsp.nvim_workspace()

lsp.setup()

-- In order to have in-line diagnostics, need to configure them AFTER the lsp-zero's setup (from the github) 
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = false,
  severity_sort = false,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
    }
})




