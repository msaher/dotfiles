local config = function()
	-- Load custom treesitter grammar for org filetype
    local orgmode = require('orgmode')
	-- orgmode.setup_ts_grammar()

	orgmode.setup({
		org_agenda_files = { "~/notes/*" },
		org_default_notes_file = "~/notes/refile.org",
        org_todo_keywords = {"TODO(t)", "WAITING(w)", "SOMEDAY(s)", "|", "DONE(d)", "CANCELLED(c)"},
        org_todo_keyword_faces = {
            SOMEDAY = ':foreground lightblue :weight bold',
            CANCELLED = ':foreground yellow #FFFFFF :slant italic :underline on',
            WAITTING = ':foreground orange #FFFFFF :weight bold',
            -- TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
        },
        org_win_split_mode = 'auto',
        org_agenda_start_on_weekday = 7, -- sunday
        org_log_into_drawer = 'LOGBOOK',
        org_highlight_latex_and_related = 'entities',
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
