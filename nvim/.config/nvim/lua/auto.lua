local api = vim.api
local basic = api.nvim_create_augroup("basic", { clear = true })

-- get rid of trailing white space before writing
api.nvim_create_autocmd("BufWritePre", {
    group = basic,
    command = [[%s/\s\+$//e]],
})

api.nvim_create_autocmd("TextYankPost", {
    group = basic,
    callback = function () vim.highlight.on_yank({}) end
})

-- disable line numbers in :term
local term = api.nvim_create_augroup("term", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = term,
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

-- vim.api.nvim_create_autocmd("TermOpen", {
--     group = term,
--     command = "setlocal statusline=%{b:term_title}",
-- })

local function disable_insert(opts)
    vim.keymap.set('n', 'i', '<nop>', opts)
    vim.keymap.set('n', 'I', '<nop>', opts)
    vim.keymap.set('n', 'o', '<nop>', opts)
    vim.keymap.set('n', 'O', '<nop>', opts)
    vim.keymap.set('n', 'a', '<nop>', opts)
    vim.keymap.set('n', 'A', '<nop>', opts)
end

vim.api.nvim_create_autocmd("TermClose", {
    group = term,
    callback = function()
        -- local event = vim.v.event
        vim.cmd.stopinsert() -- exit terminal mode
        local buf = tonumber(vim.fn.expand('<abuf>'))
        local opts = { buffer = buf }
        disable_insert(opts)

        vim.keymap.set('n', "q", function()
            api.nvim_buf_delete(buf, {})
        end,
        opts)

    end
})
