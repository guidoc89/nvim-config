local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = false,
	suggest_lsp_servers = false,
})

--
lsp.ensure_installed({
	"ts_ls",
	"eslint",
	"rust_analyzer",
	"html",
	"jsonls",
	"cssls",
	"tailwindcss",
})

	"basedpyright",
	"ruff",
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

    -- stylua: ignore start
	vim.keymap.set("n", "<leader>I", function()
		if vim.lsp.inlay_hint.is_enabled() then
			vim.lsp.inlay_hint.enable(false, { 0 })
		else
			vim.lsp.inlay_hint.enable(true, { 0 })
		end
	end, { buffer = bufnr, remap = false, desc="Inlay hints toggle" })

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc="Hover defintion (lsp)" })
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc="Diagnostics go next" })
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc="Diagnostics go prev" })
	vim.keymap.set("n", "<leader>vc", function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc="Code actions" })
	vim.keymap.set("n", "<leader>vn", function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc="Rename symbol (lsp)" })
end)
    -- stylua: ignore end

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

-- Markdown config
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

lsp.configure("html", {
	filetypes = {
		"html",
		"htmldjango",
	},
})

-- Tailwind
lsp.configure("tailwindcss", {
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
			javascript = "javascript",
			javascriptreact = "javascriptreact",
			typescriptreact = "typescriptreact",
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
		"htmldjango",
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

lsp.configure("basedpyright", {
	capabilities = {
		textDocument = {
			publishDiagnostics = {
				tagSupport = {
					valueSet = { 2 },
				},
			},
		},
	},
	settings = {
		basedpyright = {
			typeCheckingMode = "standard",
			analysis = {
				-- ignore = { "*" },
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportUndefinedVariable = "none",
					reportUnusedExpression = "none",
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
					reportUnusedCallResult = "none",
				},
			},
		},
	},
})


lsp.configure("ruff", {
	settings = {
		arg = {
			lineLength = 120,
		},
	},
	on_attach = function(client, _)
		client.server_capabilities.hoverProvider = false
	end,
})

lsp.format_mapping("<leader>;f", {
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
            "rust",
			"javascript",
			"typescript",
			"lua",
			"typescriptreact",
			"javascriptreact",
			"python",
			"htmldjango",
			"html",
		},
	},
})

lsp.setup()

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.rustfmt,
	},
})

-- In order to have in-line diagnostics, need to configure them AFTER the lsp-zero's setup (from the github)
vim.diagnostic.config({
	virtual_text = true,
  -- signs = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
      numhl = {
        [vim.diagnostic.severity.WARN] = "WarningMsg",
        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticHint",

      },
    },
	update_in_insert = false,
	underline = false,
	severity_sort = true,
    severity = {
        min = vim.diagnostic.severity.INFO,
    },
	float = {
		focusable = false,
        show_header = false,
        show_prefix = false,
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})
