vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function () vim.hl.on_yank() end,
        group = vim.api.nvim_create_augroup('custom-text-yank-post', { clear = true }),
})


vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup('custom-buf-enter', { clear = true }),
        callback = function ()

                local filetype = vim.o.filetype
                local shiftwidth_by_filetype = {
                        lua = 8,
                        json = 2,
                        javascript = 2,
                        typescript = 2,
                        javascriptreact = 2,
                        typescriptreact = 2,
                }

                vim.opt.shiftwidth = shiftwidth_by_filetype[filetype] or 4
        end,
})
