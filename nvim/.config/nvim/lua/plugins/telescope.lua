local config = function()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
	})

	local builtin = require("telescope.builtin")
	local map = function(lhs, rhs)
		vim.keymap.set("n", lhs, rhs)
	end

	map("<leader>e", "<cmd>Telescope find_files<CR>")
	map("<leader>E", "<cmd>Telescope git_files<CR>")
	map("<leader><leader>e", "<cmd>Telescope git_files<CR>")

	map("<leader>ig", "<cmd>Telescope live_grep<CR>")
	map("<leader>ifg", "<cmd>Telescope live_grep<CR>")

	map("<leader>gb", "<cmd>Telescope git_branches<CR>")

	map("<leadfer>r", "<cmd>Telescope oldfiles<CR>") -- recent files
	map("<leader>f", "<cmd>Telescope buffers<CR>")
	map("<leader><leader>f", "<cmd>Telescope buffers<CR>")

	map("<leader>ifd", "<cmd>Telescope diagnostics<CR>")
	map("<leader>ifm", "<cmd>Telescope man_pages<CR>")
	map("<leader>ifh", "<cmd>Telescope help_tags<CR>")
	map("<leader>ifT", "<cmd>Telescope treesitter<CR>")
	map("<leader>iff", "<cmd>Telescope builtin<CR>")
	map("<leader>ifx", "<cmd>Telescope commands<CR>")
	map("<leader>if:", "<cmd>Telescope command_history<CR>")
	map("<leader>ifv", "<cmd>Telescope vim_options<CR>")
	map("<leader>ift", "<cmd>Telescope tags<CR>")
	map("<leader>ifj", "<cmd>Telescope jumplist<CR>")
	map("<leader>ifo", "<cmd>Telescope oldfiles<CR>")
	map("<leader>ifq", "<cmd>Telescope quickfix<CR>")
	map("<leader>ifl", "<cmd>Telescope loclist<CR>")
	map("<leader>ifk", "<cmd>Telescope keymaps<CR>")
	map("<leader>ifs", "<cmd>Telescope spell_suggest<CR>")
	map("<leader>ifr", "<cmd>Telescope registers<CR>")
	map("<leader>ifa", "<cmd>Telescope autocommands<CR>")
	map("<leader>if/", "<cmd>Telescope search_history<CR>")
	map("<leader>ift", "<cmd>Telescope tagstack<CR>")
	map("<leader>iF", "<cmd>Telescope resume<CR>")

	map("<leader>ifc", function()
		builtin.colorscheme({ enable_preview = true })
	end)
	map("<leader>ifH", "<cmd>Telescope highlights<cr>")
	map("<leader>ifm", "<cmd>Telescope marks<cr>")
	map("<leader>ifp", "<cmd>Telescope pickers<cr>")

	-- lsp
	map("<leader>s", "<cmd>Telescope lsp_document_symbols<cr>")
	map("<leader><leader>s", "<cmd>Telescope lsp_workspace_symbols<cr>")

	local function find_config()
		local opts = {
			cwd = "$HOME/.config/nvim/",
			follow = true,
			hidden = true,
		}
		return builtin.find_files(opts)
	end

	vim.keymap.set("n", "<leader>if<leader>", find_config)

	-- custom stuff
	-- local pickers = require "telescope.pickers"
	-- local finders = require "telescope.finders"
	-- local conf = require("telescope.config").values
	-- local actions = require "telescope.actions"
	-- local action_state = require "telescope.actions.state"
	-- local make_entry = require "telescope.make_entry"
end

return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = config,
	},
}
