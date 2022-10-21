---
-- Keybindings
---
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LspAttached',
--   desc = 'LSP actions',
--   callback = function()
--     local bufmap = function(mode, lhs, rhs)
--       local opts = {buffer = true}
--       vim.keymap.set(mode, lhs, rhs, opts)
--     end
--
--     bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
--     bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
--     bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
--     bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
--     bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
--     bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
--     bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
--     bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
--     bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--     bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
--     bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
--     bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
--     bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
--   end
-- })


-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local select_opts = { behavior = cmp.SelectBehavior.Select }

-- VSCode-like icos
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

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
		}),
	    ['<C-j>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, {'i', 's'}),
        ['<C-b>'] = cmp.mapping(function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, {'i', 's'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
              local col = vim.fn.col('.') - 1
                  if cmp.visible() then
                        cmp.select_next_item()
                  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                  else
                    cmp.complete()
                  end
                    end, {'i', 's'}),
              -- if cmp.visible() then
              --       cmp.select_next_item()
              --     elseif luasnip.expand_or_jumpable() then
              --       luasnip.expand_or_jump()
              --     elseif has_words_before() then
              --       cmp.complete()
              --     else
              --       fallback()
              --     end
              --  end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                    cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'path' }, -- this was off for some reason, check if something breaks
        { name = 'nvim_lsp', keyword_lenght = 3 },
        { name = 'buffer', keyword_lenght = 3 },
        { name = 'luasnip', keyword_lenght = 2 },
    }),
    formatting = {
        fields = {'abbr', 'kind' ,'menu' },
        -- format = function(entry, item)
        --     local menu_icon = {
        --         nvim_lsp = 'λ',
        --         luasnip = '⋗',
        --         buffer = 'Ω',
        --         path = '🖫',
        --     }
        --     item.menu = menu_icon[entry.source.name]
        --     return item
        -- end,
	format =lspkind.cmp_format {
          mode = "text_symbol", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
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
              -- latex_symbols = "[LaTeX]",
              cmp_tabnine = "[Tabnine]",
              path = "[Path]",
              -- emoji = "[Emoji]",
            })[entry.source.name]
            return vim_item
          end,
        },
}
})

-- TOOD: alsot tried to disable to get rid of the boxes to the sides 
vim.cmd [[
 set completeopt=menuone,noinsert,noselect
 highlight! default link CmpItemKind CmpItemMenuDefault
]]
