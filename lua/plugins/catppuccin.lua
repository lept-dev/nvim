return {
        'catppuccin/nvim',
        priority = 1000,
        name = 'catppuccin',
        opts = {
                flavour = 'mocha',
                no_bold = true,
                no_italic = true,
                no_underline = true,
        },
        config = function (_, opts)
                require('catppuccin').setup(opts)
                vim.cmd.colorscheme('catppuccin')
        end,
}
