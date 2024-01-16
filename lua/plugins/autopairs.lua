return {
	"windwp/nvim-autopairs",
	opts = {
		filetypes = {
			"html",
			"htmldjango",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	event = "InsertEnter",
} -- to easily surround selections with delimiters
