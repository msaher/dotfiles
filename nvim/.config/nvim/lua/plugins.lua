local opts = {}

local plugins = {
    -- color schemes

    {
        "rebelot/kanagawa.nvim",
    },

    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        config = function()
            vim.cmd.colorscheme('gruvbox')
        end
    },

    {
        'folke/tokyonight.nvim',
    },

    {
        'navarasu/onedark.nvim',
    },

    'phha/zenburn.nvim',

    { "catppuccin/nvim", name = "catppuccin",
    },

    { 'rose-pine/neovim', name = 'rose-pine',
    },

    {
    'RRethy/nvim-base16',
    },

    'loctvl842/monokai-pro.nvim',


    'ofirgall/ofirkai.nvim',

    {
        'sainnhe/everforest',
    },
    --

    {
        'projekt0n/github-nvim-theme',
        -- lazy = false,
        -- config = function()
        --     vim.cmd('colorscheme github_dark')
        -- end,
    },

    {
        "EdenEast/nightfox.nvim",
    },


    {
        "fabius/molokai.nvim",
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    'neovim/nvim-lspconfig',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/nvim-cmp',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },


    'tpope/vim-commentary',
    'tpope/vim-surround',
    'tpope/vim-vinegar',
    'tpope/vim-unimpaired',

    'famiu/bufdelete.nvim',

    'norcalli/nvim-colorizer.lua',


    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', "<leader>kg", "<cmd>Git<CR>")
            vim.keymap.set('n', "<leader>ig", "<cmd>Git<CR>")
        end
    },

    {
        'msaher/bufls.nvim',
        config = function()
            vim.keymap.set('n', '<leader>b', require('bufls').ls)
        end
    },

    'axvr/org.vim',

    {
        'vim-pandoc/vim-pandoc-syntax',
        lazy = false,
    },

    {
        'vim-pandoc/vim-pandoc',
        lazy = false,
    },


    'brennier/quicktex',

    -- {dir = '~/.config/nvim/local-plugins/terman.nvim'},

    "linty-org/readline.nvim",

    {
        "williamboman/mason.nvim", config = function()
            require("mason").setup()
        end
    },

    'nvim-lualine/lualine.nvim',

    {
        -- 'msaher/compile.nvim',
        dir = '~/.config/nvim/local-plugins/compile.nvim/'
    },

    {
        'stevearc/dressing.nvim',
    },

    {
        'msaher/makegrep-job.nvim',
        config = function()
            local mg = require('makegrep-job')
            local opts = {nargs = '*', complete = 'file'}

            vim.api.nvim_create_user_command('Grep', function(data)
                mg.grep(data.args, {})
            end, opts)

            vim.api.nvim_create_user_command('Lgrep', function(data)
                mg.grep(data.args, {loclist = true})
            end, opts)

            vim.api.nvim_create_user_command('Make', function(data)
                mg.make(data.args, {})
            end, opts)

            vim.api.nvim_create_user_command('Lmake', function(data)
                mg.make(data.args, {loclist = true})
            end, opts)

        end
    },

    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    }

}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
