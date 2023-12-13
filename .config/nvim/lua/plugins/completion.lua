return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        local select_next_item = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' })

        local select_prev_item = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({ border = 'single' }),
                documentation = cmp.config.window.bordered({ border = 'single' }),
            },
            mapping = {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = select_next_item,
                ['<S-Tab>'] = select_prev_item,
                ['<Down>'] = select_next_item,
                ['<Up>'] = select_prev_item,
                ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
                ['<C-q>'] = cmp.mapping.abort(),
                ['<C-d>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if not cmp.visible_docs() then
                            cmp.mapping.open_docs()
                        else
                            cmp.mapping.close_docs()
                        end
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-Down>'] = cmp.mapping.scroll_docs(4),
                ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
            },
        })
    end,
}
