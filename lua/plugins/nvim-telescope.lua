return {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.2.1',
        dependencies = {
                'nvim-lua/plenary.nvim',
                { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        config = function ()

                local telescope = require 'telescope'
                telescope.setup {}
                pcall(telescope.load_extension, 'fzf')


                local builtin = require 'telescope.builtin'
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        end,
}
