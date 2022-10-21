local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup {}
lspconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss" },
}

local lspconfig = require("lspconfig")

lspconfig.tailwindcss.setup({
    root_dir = lspconfig.util.root_pattern('tailwind.config.js') or lspconfig.util.root_pattern('tailwind.config.js', '.git', 'postcss.config.js'),
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
    on_attach = function(client, bufnr)
        lspconfig.util.default_config.on_attach(client, bufnr)
    end,
})

