local config = function()
	-- Load custom treesitter grammar for org filetype
	require("orgmode").setup_ts_grammar()

	require("orgmode").setup({
		org_agenda_files = { "~/notes/*" },
		org_default_notes_file = "~/notes/refile.org",
	})

	-- for compleition, append org source
	local cmp = require("cmp")
	local config = cmp.get_config()
	table.insert(config.sources, {
		{ name = "orgmode" },
	})
	cmp.setup(config)
end

return {
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", lazy = true },
		{ "hrsh7th/nvim-cmp" },
	},
	config = config,
	event = "VeryLazy",
}
