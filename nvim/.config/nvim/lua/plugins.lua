local opts = {}

local plugins = {
    -- color schemes

    {
        "rebelot/kanagawa.nvim",
    },

    {
        'ellisonleao/gruvbox.nvim',
    },

    {
        'folke/tokyonight.nvim',
    },

    {
        'navarasu/onedark.nvim',
        lazy = false,
        config = function()
            vim.cmd.colorscheme('onedark')
        end,
    },

    'phha/zenburn.nvim',

    { "catppuccin/nvim", name = "catppuccin",
    },

    { 'rose-pine/neovim', name = 'rose-pine',
    },

    {
    'RRethy/nvim-base16',
    },

    'tanvirtin/monokai.nvim',
    'ofirgall/ofirkai.nvim',
    'shaunsingh/solarized.nvim',
    'sainnhe/everforest',

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

    'ThePrimeagen/harpoon',

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
    'vim-pandoc/vim-pandoc-syntax',
    'vim-pandoc/vim-pandoc',
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
        'msaher/compile.nvim',
        config = function()
            local Compile = require('compile.compile')
            local c = Compile:new({cmd = {'ls', '-l'}})
            vim.api.nvim_create_user_command('Compile', function(data)
                if #data.fargs ~= 0 then
                    c.cmd = data.fargs
                end
                c:start()
            end, {nargs = '*', complete = 'file'})

            vim.keymap.set('n', '<leader>c', "<cmd>:Compile<CR>", {})
        end
    },

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
