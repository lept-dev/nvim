return {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        config = function ()

                local parsers = {
                        'vim',
                        'lua',
                        'tsx',
                        'bash',
                        'diff',
                        'html',
                        'query',
                        'python',
                        'luadoc',
                        'vimdoc',
                        'markdown',
                        'javascript',
                        'typescript',
                        'markdown_inline',
                }
                require('nvim-treesitter').install(parsers)


                vim.api.nvim_create_autocmd('FileType', {
                        group = vim.api.nvim_create_augroup('custom-file-type', { clear = true }),
                        callback = function (args)

                                local buf, filetype = args.buf, args.match
                                local language = vim.treesitter.language.get_lang(filetype)

                                if not language then return end
                                if not vim.treesitter.language.add(language) then return end

                                vim.treesitter.start(buf, language)
                        end,
                })
        end,
}
