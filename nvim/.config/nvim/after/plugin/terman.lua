-- local A = vim.api
-- local parse = require('terman.cmd').parse
-- local Term = require('terman.term')

-- local last
-- A.nvim_create_user_command('Term', function(data)
--     local opts = parse(data.fargs)
--     last = Term:new(opts or {})
--     last:start()
-- end, { nargs = '*', complete = "file"})
-- vim.cmd.cab('term Term')

-- A.nvim_create_user_command('Send', function(data)
--     if last then
--         last:send(data.args)
--         last:show()
--     end
-- end, { nargs = '*' })

-- vim.keymap.set({'n', 't'}, "<C-g>", function()
--     if last then
--         last:toggle()
--     else
--         print('no last terminal')
--     end
-- end)

-- local function strip_ansi(s)
--     s = s:gsub('[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]', '')
--     s = s:gsub('\r', '')
--     return s
-- end

-- local function append_qf(_, data)
--     vim.fn.setqflist({}, 'a', {
--         lines = vim.tbl_map(function(s)
--             return strip_ansi(s)
--         end, data),
--     })
-- end


-- local compile
-- compile = Term:new({
--     startinsert = false,
--     -- pre_start = function()
--     --     vim.fn.setqflist({}, 'r')
--     -- end,

--     on_stdout = append_qf,
--     on_stderr = append_qf,
--     stdout_buffered = false,
--     stderr_buffered = false,

--     openwin = function()
--         local current = A.nvim_get_current_win()
--         vim.cmd.split()
--         local split = A.nvim_get_current_win()
--         A.nvim_set_current_win(current)
--         return split
--     end
-- })

-- local last_args = ""
-- A.nvim_create_user_command('Compile', function(data)
--     if data.args ~= '' then
--         last_args = data.args
--         compile:set_cmd(data.args)
--     else
--         compile:restart()
--     end
-- end, { nargs = '*', complete = "file"})

-- vim.keymap.set('n', "<leader>c", function()
--     A.nvim_feedkeys(":Compile " .. last_args, 'n', false)
--     vim.cmd.norm { bang = true, args = { ":Compile" .. last_args }}
-- end)


-- -- TODO: define a cad filetype. Make it highlight special words like 'quiz',
-- -- 'mid', 'final', 'meeting', 'hw', etc.
-- local cad = Term:new({
--     cmd = 'cad',
--     startinsert = false,
--     openwin = function()
--         local current = A.nvim_get_current_win()
--         vim.cmd.vsplit()
--         local vsplit = A.nvim_get_current_win()
--         A.nvim_set_current_win(current)
--         return vsplit
--     end

-- })

-- local function toggle_cad()
--     cad:toggle()
-- end

-- A.nvim_create_user_command('Cad', toggle_cad, {})
-- vim.keymap.set('n', '<leader><leader>c', toggle_cad)

-- vim.keymap.set('n', '<leader>t', ":Term ")
