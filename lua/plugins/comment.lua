return {
     'numToStr/Comment.nvim', -- commenting easily
      config = function()
        require('Comment').setup()
    end,
    event="VeryLazy",
}
