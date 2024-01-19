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
		"vim-pandoc/vim-pandoc",
		dependencies = { "vim-pandoc/vim-pandoc-syntax" },
		filetype = "pandoc",
		config = config,
	},
}
