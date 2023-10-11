return {
	"danymat/neogen",
	-- opts = true,
	opts = {
        enabled=true,
        languages={
            python={
                template={
                    annotation_convention="numpydoc",
                    -- annotation_convention="google_docstrings",
                }
            }
        }
    },
	keys = {
		{
			"<leader>co",
			function()
				require("neogen").generate()
			end,
			desc = "Add Docstring",
		},
	},
}
