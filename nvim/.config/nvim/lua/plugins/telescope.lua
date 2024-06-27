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

    map("<leader>iflr", "<cmd>Telescope lsp_references<cr>")
    map("<leader>iflc", "<cmd>Telescope lsp_incoming_calls<cr>")
    map("<leader>iflo", "<cmd>Telescope lsp_outgoing_calls<cr>")
    map("<leader>ifls", "<cmd>Telescope lsp_document_symbols<cr>")
    map("<leader>iflws", "<cmd>Telescope lsp_workspace_symbols<cr>")
    map("<leader>iflwd", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
    map("<leader>ifld", "<cmd>Telescope diagnostics<cr>")
    map("<leader>ifli", "<cmd>Telescope lsp_implementations<cr>")
    map("<leader>iflgd", "<cmd>Telescope lsp_definitions<cr>")
    map("<leader>iflt", "<cmd>Telescope lsp_type_definitions<cr>")

    map("<leader>gc", "<cmd>Telescope git_commits<cr>")
    map("<leader>gC", "<cmd>Telescope git_bcommits<cr>")
    map("<leader>grc", "<cmd>Telescope git_bcommits_range<cr>")
    map("<leader>gb", "<cmd>Telescope git_branches<cr>")
    map("<leader>gS", "<cmd>Telescope git_status<cr>")
    map("<leader>gs", "<cmd>Telescope git_stash<cr>")

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
		dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
		config = config,
	},
}
