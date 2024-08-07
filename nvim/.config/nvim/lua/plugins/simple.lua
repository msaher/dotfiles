local compile_config = function()
	local Compile = require("compile.task")

	local function trim(s)
		return s:match("^%s*(.-)%s*$")
	end

	local function on_exit(compile, job_id, exit_code, event)
		vim.cmd.cgetbuffer(compile.buf)
	end

	local c = Compile:new({ cmd = { "ls" }, on_exit = on_exit, auto_start = false })

	vim.api.nvim_create_user_command("Compile", function(data)
		if #data.fargs ~= 0 then
			c.cmd = data.args
		end
		c:start()
	end, { nargs = "*", complete = "file" })

	vim.keymap.set("n", "<leader>c", function()
		local cmd
		if type(c.cmd) == "table" then
			cmd = table.concat(c.cmd, " ")
		else
			cmd = c.cmd
		end

		vim.api.nvim_feedkeys(":Compile " .. trim(cmd), "n", true)
	end)

	-- local manager = require('compile.manager')

	-- local function on_exit(compile, job_id, exit_code, event)
	--     vim.cmd.cgetbuffer(compile.buf)
	-- end

	-- vim.api.nvim_create_user_command('CompileNew', function(data)
	--     local o = {cmd = data.args, auto_start = true}
	--     local c = manager.add(o)
	-- end, {nargs = '*', complete = 'file'})
end

return {

	-- "tpope/vim-commentary",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	"tpope/vim-surround",
	"tpope/vim-vinegar",
	"tpope/vim-dispatch",
	-- "tpope/vim-unimpaired",

	{
		"famiu/bufdelete.nvim",
		cmd = { "Bdelete", "Bwipeout" },
		keys = {
			{ "<leader>d", "<cmd>:Bdelete<cr>" },
		},
	},

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					tailwind = true,
				},
			})
		end,
	},

	{
		"msaher/bufls.nvim",
		config = function()
			vim.keymap.set("n", "<leader>b", require("bufls").ls)
		end,
	},

	{
		"tpope/vim-rsi",
		config = function()
			vim.cmd([[
                    inoremap <c-k> <c-o>D
                    cnoremap <c-k> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<CR>
                    ]])
		end,
	},

	{
		"stevearc/dressing.nvim",
	},

	{
		-- 'msaher/compile.nvim',
		dir = "~/.config/nvim/local-plugins/compile.nvim/",
		cond = true,
		config = function()
			require("compile")
			vim.keymap.set("n", "<leader>t", ":Task ")
		end,
	},

	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},

	{
		"ThePrimeagen/harpoon",
	},

	{
		"dkarter/bullets.vim",
		config = function()
			vim.cmd([[
            let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'pandoc',
            \ 'scratch'
            \]
            ]])
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			plugins = {
				registers = false,
			},
		},
	},

	{
		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { enabled = false },
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todo = require("todo-comments")
			todo.setup()

			vim.keymap.set("n", "]t", function()
				todo.jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				todo.jump_prev()
			end, { desc = "Previous todo comment" })
		end,
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod" },
			{ "tpope/vim-dotenv" },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
		},
		-- cmd = {
		--     'DBUI',
		--     'DBUIToggle',
		--     'DBUIAddConnection',
		--     'DBUIFindBuffer',
		-- },
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_env_variable_url = "DATABASE_URL"
		end,
	},

	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	{
		"mong8se/buffish.nvim",
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettierd", "prettier" } },
				},
			})

			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			vim.api.nvim_create_user_command("Format", function()
				require("conform").format()
			end, {})
		end,
	},

    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                javascript = { "eslint" },
                typescript = { "eslint" },
                javascriptreact = { "eslint" },
                typescriptreact = { "eslint" },
            }
        end,
        vim.api.nvim_create_user_command("Lint", function(data)
            if data.args ~= nil then
                require("lint").try_lint(data.args)
            else
                require("lint").try_lint()
            end
        end, { nargs = "?"})
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
    }
}
