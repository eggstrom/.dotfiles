return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = 'tabs',
            diagnostics = 'nvim_lsp',
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Tree',
                },
            },
        },
    },
}
