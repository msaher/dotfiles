local config = function()
	vim.g["pandoc#folding#fdc"] = 0
	vim.g["pandoc#formatting#mode"] = "s"
	vim.g["pandoc#formatting#textwidth"] = 80
	vim.g["pandoc#formatting#equalprg"] = "pandoc -t markdown --columns "
		.. vim.g["pandoc#formatting#textwidth"]
		.. " --wrap=none"
end

return {
	{
		"vim-pandoc/vim-pandoc-syntax",
		lazy = false,
		config = config,
	},

	{
		"vim-pandoc/vim-pandoc",
		lazy = false,
		config = config,
	},
}
