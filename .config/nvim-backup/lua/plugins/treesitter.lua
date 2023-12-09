require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c', 'cpp', 'css',
        'html',
        'java', 'javascript', 'json',
        'lua',
        'python',
        'rust',
        'scss', 'sql',
        'toml', 'typescript',
        'vim', 'vimdoc',
        'xml',
        'yaml', 'yuck',
    },
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
