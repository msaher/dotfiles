local opts = { buffer = 0 }
vim.keymap.set("n", "<CR>", "<Plug>RestNvim", opts)
vim.keymap.set("n", "<leader><CR>", "<Plug>RestNvimPreview", opts)
