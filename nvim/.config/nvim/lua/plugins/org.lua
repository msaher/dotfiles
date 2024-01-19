local config = function()
	-- Load custom treesitter grammar for org filetype
	require("orgmode").setup_ts_grammar()

	require("orgmode").setup({
		org_agenda_files = { "~/notes/*" },
		org_default_notes_file = "~/notes/refile.org",
	})
end

return {
	"nvim-orgmode/orgmode",
	dependencies = { "nvim-treesitter/nvim-treesitter", lazy = true },
	config = config,
	event = "VeryLazy",
}
