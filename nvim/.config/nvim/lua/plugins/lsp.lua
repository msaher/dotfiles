local config = function()
	local lsp = require("lspconfig")

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader><leader>ge", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "g<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>Wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader><leader>a", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<leader><leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
	end

	-- cmp
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	lsp.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
	lsp.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
	lsp.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
	lsp.texlab.setup({ on_attach = on_attach, capabilities = capabilities })
	lsp.tsserver.setup({ on_attach = on_attach, capabilities = capabilities })

	lsp.rust_analyzer.setup({ on_attach = on_attach, capabilities = capabilities })

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
}