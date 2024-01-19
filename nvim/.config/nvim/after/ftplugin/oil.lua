local oil = require("oil")

vim.keymap.set("n", "l", "<CR>", { remap = true, buffer = true })
vim.keymap.set("n", "h", "-", { remap = true, buffer = true })
vim.keymap.set("n", "q", oil.close, { buffer = true, nowait = true })
