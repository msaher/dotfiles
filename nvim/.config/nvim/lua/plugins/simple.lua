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
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-vinegar",
	"tpope/vim-unimpaired",

	"famiu/bufdelete.nvim",

	"norcalli/nvim-colorizer.lua",

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>kg", "<cmd>Git<CR>")
			vim.keymap.set("n", "<leader>ig", "<cmd>Git<CR>")
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
            vim.keymap.set('n', "<leader>t", "<cmd>:Task<cr>")
        end,
	},

    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },

    {
        'ThePrimeagen/harpoon'
    },


    {
        'dkarter/bullets.vim',
        config = function()
            vim.cmd[[
            let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'pandoc',
            \ 'scratch'
            \]
            ]]
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        'stevearc/overseer.nvim',
        opts = {},
        config = function()
            require('overseer').setup()
        end
    },

    {'kevinhwang91/nvim-bqf'}
}