local function emacs()
    local filename = vim.fn.expand('%')
    if filename == '' then
        return
    end
    if vim.bo.modified then
        vim.cmd.echo('"Buffer modified... Not switching"')
    else
        vim.api.nvim_buf_delete(0, {})
        vim.cmd([[!emacs ]] .. filename)
    end
end

vim.api.nvim_create_user_command("InEmacs", emacs,
    { desc = "Open the current buffer in emacs"})
