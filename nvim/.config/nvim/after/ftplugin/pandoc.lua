vim.keymap.set('n', "<leader>=", function ()
    -- TODO:
    -- vim.cmd.bang
    print(vim.g['g:pandoc#formatting#equalprg'])
end)

vim.keymap.set('n', '<tab>', "za", { buffer = true })
