return {
        'neovim/nvim-lspconfig',
        dependencies = {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function ()

                require('mason').setup {}
                require('mason-lspconfig').setup {
                        ensure_installed = {
                                'ts_ls',
                                'lua_ls',
                        },
                }


                vim.lsp.config('*', {
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                })


                vim.api.nvim_create_autocmd('LspAttach', {
                        group = vim.api.nvim_create_augroup('custom-lsp-attach', { clear = true }),
                        callback = function (args)

                                local bufnr = args.buf

                                vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
                                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
                                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
                                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
                        end,
                })
        end,
}
