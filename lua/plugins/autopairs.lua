return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup {}
    end,
    event="VeryLazy",
} -- to easily surround selections with delimiters
