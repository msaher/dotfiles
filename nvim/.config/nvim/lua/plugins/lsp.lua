local function map(modes, lhs, rhs, opts, desc)
	local options = vim.tbl_extend("force", opts, { desc = desc })
	vim.keymap.set(modes, lhs, rhs, options)
end

local function on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, bufopts, "declaration")
	map("n", "gd", vim.lsp.buf.definition, bufopts, "definition")
	map("n", "K", vim.lsp.buf.hover, bufopts, "hover")
	map("n", "gI", vim.lsp.buf.implementation, bufopts, "implementation")
	map("n", "g<C-k>", vim.lsp.buf.signature_help, bufopts, "signature_help")
	map("n", "gr", vim.lsp.buf.references, bufopts, "references")

	map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, bufopts, "workspace add")
	map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts, "remove workspace")
	map("n", "<leader>lwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts, "list workspaces")

	map("n", "<leader>ld", vim.lsp.buf.type_definition, bufopts, "type_definition")
	map("n", "<leader>lrn", vim.lsp.buf.rename, bufopts, "rename")
	map("n", "<leader>la", vim.lsp.buf.code_action, bufopts, "code_action")
	map("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts, "format")
end

local config = function()
	local lsp = require("lspconfig")

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local map_opts = { noremap = true, silent = true }
	map("n", "[d", vim.diagnostic.goto_prev, map_opts)
	map("n", "]d", vim.diagnostic.goto_next, map_opts)
	map("n", "<leader><leader>df", vim.diagnostic.open_float, map_opts, "diagnostic float")
	map("n", "<leader><leader>dq", vim.diagnostic.setloclist, map_opts, "diagnostic location list")

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	-- cmp
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	local lsp_opts = { on_attach = on_attach, capabilities = capabilities }
	lsp.clangd.setup(lsp_opts)
	lsp.pyright.setup(lsp_opts)
	lsp.cssls.setup(lsp_opts)
	lsp.texlab.setup(lsp_opts)
	lsp.tsserver.setup(lsp_opts)
	lsp.rust_analyzer.setup(lsp_opts)

	lsp.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,

		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{ "j-hui/fidget.nvim", opts = {} },

	{ "folke/neodev.nvim", opts = {} },
}
