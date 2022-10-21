require('toggleterm').setup({
    open_mapping = [[<C-g>]],
    direction = 'horizontal',
    shade_terminals = true,
    shell = vim.o.shell,
    close_on_exit= true,
})
