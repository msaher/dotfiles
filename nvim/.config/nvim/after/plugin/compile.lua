local Compile = require('compile.compile')

local function trim(s)
   return s:match( "^%s*(.-)%s*$" )
end


local function on_exit(compile, job_id, exit_code, event)
    vim.cmd.cgetbuffer(compile.buf)
end

local c = Compile:new({cmd = {'ls'}, on_exit = on_exit})

vim.api.nvim_create_user_command('Compile', function(data)
    if #data.fargs ~= 0 then
        c.cmd = data.args
    end
    c:start()
end, {nargs = '*', complete = 'file'})

vim.keymap.set('n', '<leader>c', function()
    local cmd;
    if type(c.cmd) == 'table' then
        cmd = table.concat(c.cmd, " ")
    else
        cmd = c.cmd
    end


    vim.api.nvim_feedkeys(':Compile ' ..  trim(cmd), 'n', true)
end)
