-- return {}

return {
    {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    cmd = { "MarkdownPreview"},
    },
    {
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
        end,
        event="VeryLazy",
    },
}
