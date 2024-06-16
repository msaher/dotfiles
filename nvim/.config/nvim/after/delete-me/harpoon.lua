vim.keymap.set("n", "<leader>m", function()
	require("harpoon.mark").add_file()
end)

vim.keymap.set("n", "gh", function()
	require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set("n", "<C-h>", function()
	require("harpoon.ui").nav_file(1)
end)

vim.keymap.set("n", "<C-j>", function()
	require("harpoon.ui").nav_file(2)
end)

vim.keymap.set("n", "<C-k>", function()
	require("harpoon.ui").nav_file(3)
end)

vim.keymap.set("n", "<C-l>", function()
	require("harpoon.ui").nav_file(4)
end)