-- local mason = require("mason")
-- local mason_config = require("mason-lspconfig")
-- local lspconfig = require("lspconfig")
--
-- mason.setup()
-- mason_config.setup()
--
-- require("nvim-lsp-installer").setup({})
--
-- -- From the reddit post
-- --
--
-- local function lsp_keymaps(bufnr)
--     local opts = {noremap = true, silent =true}
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>',opts)
--     vim.api.nvim_buf_set_keymap(bufnr,'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>',opts)
-- end
--
-- -- set autocommands conditional on server_capabilities
-- local function lspconfig_highlight_document(client, bufnr)
--     if client.server_capabilities.documentHighlighProvider then
--         vim.api.nvim_create_augroup("lsp_document_highlight", {
--             clear = false
--     })
--         vim.api.nvim_clear_autocmds({
--             buffer = bufnr, 
--             group = "lsp_document_highlight",
--     })
--         vim.api.nvim_clear_autocmds({ "CursorHold","CursorHoldI"}, {
--             buffer = bufnr, 
--             group = "lsp_document_highlight",
--             callback = vim.lsp.buf.document_highlight,
--     })
--         vim.api.nvim_clear_autocmds({ "CursorMoved"}, {
--             buffer = bufnr, 
--             group = vim.lsp.buf.clear_references,
--     })
--     end
-- end
--
--
-- -- From the Blog: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- local lsp_defaults = {
--     flags = {
--             debounce_text_changes = 150,
--         },
--         capabilities = require('cmp_nvim_lsp').default_capabilities(),
--         on_attach = function(client, bufnr)
--             lsp_keymaps(bufnr)
--             lspconfig_highlight_document(client,bufnr)
--             -- vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
--             -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--             -- vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
--         end
-- }
--
-- ---
-- -- Diagnostics
-- ---
--
-- local signs = {
--     {name = "DiagnosticSignError", text = ""},
--     {name = "DiagnosticSignWarn", text = ""},
--     {name = "DiagnosticSignHint", text = ""},
--     {name = "DiagnosticSignInfo", text = ""},
-- }
--
--
-- for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, {texthl=sign.name, text=sign.text, numhl=sign.name})
-- end
--
-- vim.diagnostic.config({
--   virtual_text = { prefix = "" },
--   underline = false,
--   signs = {
--         active = signs,
--     },
--   update_in_insert = false,
--   severity_sort = false,
--   float = {
--     focusable = false,
--     border = 'rounded',
--     style = 'minimal',
--     source = 'always',
--     header = '',
--     prefix = '',
--   },
-- })
--
-- -- supress error messages from lang servers (have no idea what it does)
-- vim.notify = function(msg, log_level)
--     if msg:match "exit code" then
--         return
--     end
--     if log_level == vim.log.levels.ERROR then
--         vim.api.nvim_err_writeln(msg)
--     else
--         vim.api.nvim_echo({ { msg }}, true, {})
--     end
-- end
--
--
--
-- lspconfig.util.default_config = vim.tbl_deep_extend(
--     'force',
--     lspconfig.util.default_config,
--     lsp_defaults
-- )
-- -- From the Blog: https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
--
-- -- From the japanese video
-- local lsp_flags = {
--     -- This is the default in Nvim 0.7+
--     debounce_text_changes = 150,
-- }
--
-- lspconfig.sumneko_lua.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 -- Getthe lanaguage server to recognize the 'vim' global
--                 globals = { 'vim' }
--             },
--             workspace = {
--                 library = vim.api.nvim_get_runtime_file("", true),
--                 checkThirdParty = false
--             }
--         }
--     }
-- }
--
--
--
-- lspconfig.pyright.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.html.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.volar.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.taplo.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.jsonls.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.tailwindcss.setup({
--     -- root_dir = lspconfig.util.root_pattern('tailwind.config.js') or lspconfig.util.root_pattern('tailwind.config.js', '.git', 'postcss.config.js'),
-- 	init_options = {
-- 		userLanguages = {
-- 			elixir = "phoenix-heex",
-- 			eruby = "erb",
-- 			heex = "phoenix-heex",
-- 			svelte = "html",
-- 		},
-- 	},
-- 	handlers = {
-- 		["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
-- 			vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
-- 		end,
-- 	},
-- 	settings = {
-- 		includeLanguages = {
-- 			typescript = "javascript",
-- 			typescriptreact = "javascript",
-- 			["html-eex"] = "html",
-- 			["phoenix-heex"] = "html",
-- 			heex = "html",
-- 			eelixir = "html",
-- 			elm = "html",
-- 			erb = "html",
-- 			svelte = "html",
-- 		},
-- 		tailwindCSS = {
-- 			lint = {
-- 				cssConflict = "warning",
-- 				invalidApply = "error",
-- 				invalidConfigPath = "error",
-- 				invalidScreen = "error",
-- 				invalidTailwindDirective = "error",
-- 				invalidVariant = "error",
-- 				recommendedVariantOrder = "warning",
-- 			},
-- 			experimental = {
-- 				classRegex = {
-- 					[[class= "([^"]*)]],
-- 					[[class: "([^"]*)]],
-- 					'~H""".*class="([^"]*)".*"""',
-- 				},
-- 			},
-- 			validate = true,
-- 		},
-- 	},
-- 	filetypes = {
-- 		"css",
-- 		"scss",
-- 		"sass",
-- 		"html",
-- 		"heex",
-- 		"elixir",
-- 		"eruby",
-- 		"javascript",
-- 		"javascriptreact",
-- 		"typescript",
-- 		"typescriptreact",
-- 		"svelte",
-- 	},
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
-- })
--
-- lspconfig.eslint.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--      root_dir = function() return vim.loop.cwd() end,
--     flags = lsp_flags,
-- }
--
-- lspconfig.tsserver.setup {
--     on_attach =  function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript"},
--     cmd = { "typescript-language-server", "--stdio" },
--     -- root_dir = function() return vim.loop.cwd() end
-- }
--
-- lspconfig.rust_analyzer.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--         ["rust-analyzer"] = {}
--     }
-- }
--
-- lspconfig.cssls.setup {
--     on_attach = function(client, bufnr)
--         lspconfig.util.default_config.on_attach(client, bufnr)
--     end,
--     -- root_dir = function() return vim.loop.cwd() end,
-- }
--


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local M = {}

local lspconfig = require("lspconfig")


M.setup = function()
local signs = {
    {name = "DiagnosticSignError", text = ""},
    {name = "DiagnosticSignWarn", text = ""},
    {name = "DiagnosticSignHint", text = ""},
    {name = "DiagnosticSignInfo", text = ""},
}

  for _, sign in ipairs(signs) do
    -- vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl ='' })
  end

  local config = {
    -- disable virtual text
    -- virtual_text = false,
    virtual_text = { prefix = "" },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = false,
    underline = false,
    severity_sort = false,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single"
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    focusable = true,
    relative = "cursor"
  })

  -- suppress error messages from lang servers
  vim.notify = function(msg, log_level)
    if msg:match "exit code" then
      return
    end
    if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
    else
      vim.api.nvim_echo({ { msg } }, true, {})
    end
  end

  -- Borders for LspInfo winodw
  local win = require "lspconfig.ui.windows"
  local _default_opts = win.default_opts

  win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "single"
    return opts
  end
end

local function lsp_highlight_document(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  -- Declaration and definition
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

  -- Docs
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  -- Diagnostic
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ float=false })<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next({ float=false })<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local cmp_capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

cmp_capabilities.textDocument.semanticHighlighting = true
-- cmp_capabilities.offsetEncoding = "utf-8"

M.capabilities = cmp_capabilities

M.setup()
--------------------------------------------------

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lspconfig.sumneko_lua.setup {
        on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- on_attach = function(client, bufnr)
    --     lspconfig.util.default_config.on_attach(client, bufnr)
    -- end,
    settings = {
        Lua = {
            diagnostics = {
                -- Getthe lanaguage server to recognize the 'vim' global
                globals = { 'vim' }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            }
        }
    }
}
--
--
--
lspconfig.pyright.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
}

lspconfig.html.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
}

lspconfig.volar.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
}

lspconfig.taplo.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
}

lspconfig.jsonls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
}

lspconfig.tailwindcss.setup({
    -- root_dir = lspconfig.util.root_pattern('tailwind.config.js') or lspconfig.util.root_pattern('tailwind.config.js', '.git', 'postcss.config.js'),
	init_options = {
		userLanguages = {
			elixir = "phoenix-heex",
			eruby = "erb",
			heex = "phoenix-heex",
			svelte = "html",
		},
	},
	handlers = {
		["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
			vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
		end,
	},
	settings = {
		includeLanguages = {
			typescript = "javascript",
			typescriptreact = "javascript",
			["html-eex"] = "html",
			["phoenix-heex"] = "html",
			heex = "html",
			eelixir = "html",
			elm = "html",
			erb = "html",
			svelte = "html",
		},
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					[[class= "([^"]*)]],
					[[class: "([^"]*)]],
					'~H""".*class="([^"]*)".*"""',
				},
			},
			validate = true,
		},
	},
	filetypes = {
		"css",
		"scss",
		"sass",
		"html",
		"heex",
		"elixir",
		"eruby",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
    on_attach = M.on_attach,
    capabilities = M.capabilities,
})

lspconfig.eslint.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
     root_dir = function() return vim.loop.cwd() end,
    flags = lsp_flags,
}


lspconfig.tsserver.setup {
    capabilities = M.capabilities,
    on_attach = M.on_attach,
    flags = lsp_flags,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript"},
    cmd = { "typescript-language-server", "--stdio" },
    -- root_dir = function() return vim.loop.cwd() end
}

lspconfig.rust_analyzer.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}

lspconfig.cssls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    -- root_dir = function() return vim.loop.cwd() end,
}
