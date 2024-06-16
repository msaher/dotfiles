local opt = vim.opt

vim.g.netrw_banner = 0 -- disable netrw help

-- opt.clipboard:append("unnamedplus") -- default register is +

-- see https://github.com/neovim/neovim/issues/9888#issuecomment-917381701
opt.fsync = true

opt.termguicolors = true -- use true colros

opt.wrap = false
opt.expandtab = true -- spaces instead of tabs
opt.tabstop = 4 -- tabs are 4 cols wide
opt.shiftwidth = 0 -- match tabstop
opt.hlsearch = false -- renable with <leader>/

opt.undofile = true -- save undo history
opt.backup = true
opt.textwidth = 80
-- don't litter directories with backups
opt.backupdir:remove(".")

-- splits where I expect them
opt.splitright = true
opt.splitbelow = true

opt.mouse = "a"

-- ignore case unless a there's a captical letter
opt.ignorecase = true
opt.smartcase = true

opt.number = true
-- opt.relativenumber = true

opt.cursorline = false

-- TODO: if running wsl windows, use s else use xdg-open
vim.g.netrw_browsex_viewer = "s"

-- opt.guicursor = ''
opt.guicursor:append("a:blinkon100")

-- statusbar
opt.laststatus = 2

if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep"
end

-- set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[5 q'
-- vim.cmd([[
-- let g:clipboard = {
--                         \   'name': 'win32yank-wsl',
--                         \   'copy': {
--                         \      '+': 'win32yank.exe -i --crlf',
--                         \      '*': 'win32yank.exe -i --crlf',
--                         \    },
--                         \   'paste': {
--                         \      '+': 'win32yank.exe -o --lf',
--                         \      '*': 'win32yank.exe -o --lf',
--                         \   },
--                         \   'cache_enabled': 0,
--                         \ }
--                         " }}}
--     ]])

vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
	['+'] = "clip.exe",
	['*'] = "clip.exe",
    },
    paste = {
	['+'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
	['*'] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
    },
    cache_enabled = 0,
}


-- vim.g.clipboard = {
--     name = 'myClipboard',
--     copy = {
--         ['+'] = 'tmux load-buffer -',
--         ['*'] = 'tmux load-buffer -',
--     },
--     paste = {
--         ['+'] = 'tmux save-buffer -',
--         ['*'] = 'tmux save-buffer -',
--     },
--     cache_enabled = 1,
-- }
