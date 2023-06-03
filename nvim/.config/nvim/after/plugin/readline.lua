local readline = require 'readline'

vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.dwim_backward_kill_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
-- vim.keymap.set('!', '<C-w>', readline.unix_word_rubout)
vim.keymap.set('!', '<C-d>', '<Delete>')  -- delete-char
vim.keymap.set('!', '<C-h>', '<BS>')      -- backward-delete-char
vim.keymap.set('!', '<C-a>', readline.dwim_beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-f>', '<Right>') -- forward-char
vim.keymap.set('!', '<C-b>', '<Left>')  -- backward-char
-- vim.keymap.set('!', '<C-n>', '<Down>')  -- next-line
-- vim.keymap.set('!', '<C-p>', '<Up>')    -- previous-line
