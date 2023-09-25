-- VSCode-like icons
local kind_icons = {
	Text = "",
	Function = "",
	Method = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

--
lsp.ensure_installed({
	"tsserver",
	"eslint",
	--'lua-language-server',
	"rust_analyzer",
	-- "pyright",
	"html",
	"jsonls",
	"cssls",
	-- 'r_language_server',
	"tailwindcss",
})

local lspkind = require("lspkind")
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "otter" },
		{ name = "latex" },
		{ name = "neorg" },
	},
	mapping = cmp_mappings,
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			mode = "text_symbol",
			max_width = 50,
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				local shorten_abbr = string.sub(vim_item.abbr, 1, 30)
				if shorten_abbr ~= vim_item.abbr then
					vim_item.abbr = shorten_abbr .. "..."
				end
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
					emoji = "[Emoji]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.lsp.buf.open_float()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vc", function()
		vim.lsp.buf.code_action()
	end, opts)
	-- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vn", function()
		vim.lsp.buf.rename()
	end, opts)
	-- vim.keymap.set("i", "<C-h>", function()   -- used for harpoon
	-- 	vim.lsp.buf.signature_help()
	-- end, opts)
end)

lsp.configure("lua_ls", {
	settings = {
		completions = {
			completeFunciontCalls = true,
		},
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Markdown config (TODO: does it work?)
lsp.configure("marksman", {
	settings = {
		completions = {
			completeFunciontCalls = true,
		},
	},
	filetypes = {
		"quarto",
		"markdown",
		"ju.py",
		"jupyter",
		"python",
	},
	flags = {
		debounce_text_changes = 200,
	},
})

-- Tailwind
require("lspconfig").tailwindcss.setup({
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_dir = require("lspconfig.util").root_pattern(
		"tailwind.config.js",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.ts",
		"package.json",
		"node_modules",
		".git"
	),
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
		-- "python", -- ex: for Dash classes
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
})

-- Tailwind
-- lsp.configure('tailwindcss', {
--     cmd= { "tailwindcss-language-server", "--stdio" },
--      root_dir = require('lspconfig.util').root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
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
--         "python", -- ex: for Dash classes
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
-- })

-- Pyright disabling (for linting)
lsp.configure("pyright", {
	capabilities = (function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
		return capabilities
	end)(),
	settings = {
		python = {
			analysis = {
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				diagnosticSeverityOverrides = {
					reportUnusedVariable = "warning", -- or anything
				},
				typeCheckingMode = "basic",
			},
		},
	},
})
--
--
-- After didabling pyright, activate ruff for linting (TODO: how to implement pyright only for completion, and ruff for linting without having duplicate diagnostics??)
-- lsp.configure('ruff_lsp', {
--     settings = {
--         arg = {
--             lineLength = 120,
--         },
--     },
--     on_attach = function(client, bufnr)
--         client.server_capabilities.hoverProvider = false
--     end
--     }
-- )

--
-- lsp.skip_server_setup({ "pyright" })
lsp.skip_server_setup({ "ruff_lsp" })

lsp.format_mapping("<leader>;f", {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "lua", "typescriptreact", "javascriptreact", "python" },
	},
})

lsp.setup()

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.black.with({ extra_args = {"--diff", "--check", "--color" }}),
	},
})

-- In order to have in-line diagnostics, need to configure them AFTER the lsp-zero's setup (from the github)
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
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
})
