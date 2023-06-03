-- make pasting nicer
local nv = { 'n', 'v' }
vim.keymap.set(nv, "<leader>y", [["+y]])
vim.keymap.set(nv, "<leader>Y", [["+y$]])
vim.keymap.set(nv, "<leader>p", [["+p]])
vim.keymap.set(nv, "<leader>P", [["+P]])
vim.keymap.set(nv, "<leader>o", [["0p]])
vim.keymap.set(nv, "<leader>O", [["0P]])

-- aliases
vim.keymap.set('n', "<leader>a", "A")
vim.keymap.set('n', "<leader>;", ":")
vim.keymap.set('n', "<leader>w", "<cmd>w<CR>")
vim.keymap.set('n', "<leader>d", "<cmd>bd<CR>");

vim.keymap.set('i', "<C-h>", "<C-w>") -- C-h == C-BS
vim.keymap.set('i', "jk", "<esc>")
vim.keymap.set('i', "<A-space>", "<esc>")

vim.keymap.set('n', "<leader>i/", "<cmd>set invhlsearch<CR>")
-- vim.keymap.set('n', "<leader>ie", ":e ")

vim.keymap.set('n', "<leader>e", ":e ")
vim.keymap.set('n', "<leader>3", "<C-6>")

vim.keymap.set('t', "jk", [[<C-\><C-n>]])

vim.keymap.set('n', "<C-d>", "<C-d>zz", {silent = true})
vim.keymap.set('n', "<C-u>", "<C-u>zz", {silent = true})
vim.keymap.set('n', "<C-f>", "<C-f>zz", {silent = true})
vim.keymap.set('n', "<C-b>", "<C-b>zz", {silent = true})

vim.keymap.set('n', '[a', "<cmd>next<CR>")
vim.keymap.set('n', ']a', "<cmd>previous<CR>")
vim.keymap.set('n', '[b', "<cmd>bprevious<CR>")
vim.keymap.set('n', ']b', "<cmd>bnext<CR>")

-- vim.keymap.set('n', "<C-w>o", "<nop>")
-- vim.keymap.set('n', "<C-w>h", "<nop>")
-- vim.keymap.set('n', "<C-w>j", "<nop>")
-- vim.keymap.set('n', "<C-w>k", "<nop>")
-- vim.keymap.set('n', "<C-w>l", "<nop>")
-- vim.keymap.set('n', "<C-w>H", "<nop>")
-- vim.keymap.set('n', "<C-w>J", "<nop>")
-- vim.keymap.set('n', "<C-w>K", "<nop>")
-- vim.keymap.set('n', "<C-w>L", "<nop>")
-- vim.keymap.set('n', "<C-w>w", "<nop>")
-- vim.keymap.set('n', "<C-w>w", "<nop>")
-- vim.keymap.set('n', "<C-w>s", "<nop>")
-- vim.keymap.set('n', "<C-w>v", "<nop>")

-- non-canonical remaps

vim.keymap.set('n', ',', '<C-w>w')
vim.keymap.set('n', '<leader>i,', ',')
-- vim.keymap.set('n', '<leader>,', '<C-w>c')
-- vim.keymap.set('n', '<leader>g,', '<C-w>o')
vim.keymap.set('n', '3', '<C-w>o')
vim.keymap.set('n', '<leader>3', '<C-w>c')
vim.keymap.set('n', '<leader>k3', '<cmd>b#<cr>')

vim.keymap.set('n', '4', '<C-w>s')
vim.keymap.set('n', '<leader>4', '<C-w>v')
vim.keymap.set('n', '5', '<C-w>=')

-- restore digits
for d=1,9 do
    vim.keymap.set('n', '<leader>i' .. d, '' .. d);
end
