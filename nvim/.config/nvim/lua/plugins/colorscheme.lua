return {

	{
		"rebelot/kanagawa.nvim",
	},

	{
		"ellisonleao/gruvbox.nvim",
		-- lazy = false,
		-- config = function()
		--     require("gruvbox").setup({
		--         italic = {
		--             strings = false,
		--             comments = false,
		--             operators = false,
		--             folds = false,
		--         },
		--     })
		--     vim.cmd.colorscheme('gruvbox')
		-- end
	},

	{
		"folke/tokyonight.nvim",
	},

	{
		"navarasu/onedark.nvim",
		config = function()
		    vim.cmd.colorscheme("onedark")
		end
	},

	-- {
	--     "calind/selenized.nvim",
	--     lazy = false,
	--     config = function()
	--         vim.cmd.colorscheme('selenized')
	--     end
	-- },

	"phha/zenburn.nvim",

	{
		"catppuccin/nvim",
		name = "catppuccin",
	},

	{ "rose-pine/neovim", name = "rose-pine" },

	{
		"RRethy/nvim-base16",
		-- config = function()
		--     vim.cmd.colorscheme("base16-tomorrow-night")
		-- end
	},

	"loctvl842/monokai-pro.nvim",

	"ofirgall/ofirkai.nvim",

	{
		"sainnhe/everforest",
	},
	--

	{
		"projekt0n/github-nvim-theme",
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
}
