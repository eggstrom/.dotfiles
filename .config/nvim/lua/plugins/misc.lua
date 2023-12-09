-- File tree
require('nvim-tree').setup()

-- Indentation guide
require('ibl').setup({
    scope = { enabled = false, },
})

-- Change line number color based on mode
require('modicator').setup()
