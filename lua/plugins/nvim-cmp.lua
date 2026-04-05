return {
        'hrsh7th/nvim-cmp',
        dependencies = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-nvim-lsp',
                'saadparwaiz1/cmp_luasnip',
        },
        config = function ()

                local cmp = require 'cmp'
                local luasnip = require 'luasnip'

                cmp.setup {
                        snippet = {
                                expand = function (args) luasnip.lsp_expand(args.body) end,
                        },
                        sources = cmp.config.sources({
                                { name = 'luasnip' },
                                { name = 'nvim_lsp' },
                        }, {
                                { name = 'path' },
                                { name = 'buffer' },
                        }),
                        mapping = cmp.mapping.preset.insert({
                                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                                ['<C-space>'] = cmp.mapping.complete(),
                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                ['<Tab>'] = cmp.mapping(function (fallback)
                                        if cmp.visible() then
                                                cmp.select_next_item()
                                        elseif luasnip.expand_or_jumpable() then
                                                luasnip.expand_or_jump()
                                        else
                                                fallback()
                                        end
                                end, { 'i', 's' })
                        }),
                }
        end,
}
