require("remaps")
require("auto")
require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.opt.laststatus = 3

vim.keymap.set({'n', 'v'}, "<leader>0", [["0p]])
vim.keymap.set({'n', 'v'}, "<leader>)", [["0P]])
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
