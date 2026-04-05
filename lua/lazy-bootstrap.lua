local function clone_lazynvim(dir)

        local output = vim.fn.system {
                'git',
                'clone',
                '--filter=blob:none',
                '--branch=stable',
                'https://github.com/folke/lazy.nvim.git',
                dir,
        }

        if vim.v.shell_error ~= 0 then
                print('Failed to clone lazy.nvim \n' .. output)
                os.exit()
        end
end

local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then clone_lazynvim(lazypath) end


vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
        ui = {
                icons = {
                        ft = '[ft]',
                        cmd = '[cmd]',
                        task = '[task]',
                        lazy = '[lazy]',
                        init = '[init]',
                        keys = '[keys]',
                        start = '[start]',
                        event = '[event]',
                        source = '[source]',
                        config = '[config]',
                        plugin = '[plugin]',
                        runtime = '[runtime]',
                        require = '[require]',
                },
        },
})
