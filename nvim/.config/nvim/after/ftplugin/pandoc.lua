vim.keymap.set('n', '<tab>', "za", { buffer = true })

vim.keymap.set('n', 'A', "g$a", { buffer = true })
vim.keymap.set('n', 'I', "g^i", { buffer = true })

-- vim.opt_local.formatprg = "pandoc -t markdown --columns " .. vim.g['pandoc#formatting#textwidth'] .. ' --wrap=none'
vim.opt_local.wrap = true
