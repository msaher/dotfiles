vim.keymap.set('n', '<tab>', "za", { buffer = true })

vim.keymap.set('n', 'A', "g$i", { buffer = true })
vim.keymap.set('n', 'I', "g^i", { buffer = true })

vim.opt_local.formatprg = vim.g['pandoc#formatting#equalprg']
