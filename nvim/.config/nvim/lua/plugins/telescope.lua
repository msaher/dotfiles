local config = function()

    local actions = require("telescope.actions")
    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                },
            }
        },
    }

    local builtin = require("telescope.builtin")


    vim.keymap.set('n', "<leader>e", builtin.find_files)
    vim.keymap.set('n', "<leader><leader>e", builtin.git_files)
    vim.keymap.set('n', "<leadfer>r", builtin.oldfiles) -- recent files
    vim.keymap.set('n', "<leader>g", builtin.live_grep)
    vim.keymap.set('n', "<leader>f", builtin.buffers)
    vim.keymap.set('n', "<leader><leader>f", builtin.buffers)

    vim.keymap.set('n', "<leader>ifd", builtin.diagnostics)
    vim.keymap.set('n', "<leader>ifm", builtin.man_pages)
    vim.keymap.set('n', "<leader>ifh", builtin.help_tags)
    vim.keymap.set('n', "<leader>ifT", builtin.treesitter)
    vim.keymap.set('n', "<leader>iff", builtin.builtin)
    vim.keymap.set('n', "<leader>ifx", builtin.commands)
    vim.keymap.set('n', "<leader>if:", builtin.command_history)
    vim.keymap.set('n', "<leader>ifv", builtin.vim_options)
    vim.keymap.set('n', "<leader>ift", builtin.tags)
    vim.keymap.set('n', "<leader>ifj", builtin.jumplist)
    vim.keymap.set('n', "<leader>ifo", builtin.oldfiles)
    vim.keymap.set('n', "<leader>ifq", builtin.quickfix)
    vim.keymap.set('n', "<leader>ifl", builtin.loclist)
    vim.keymap.set('n', "<leader>ifk", builtin.keymaps)
    vim.keymap.set('n', "<leader>ifs", builtin.spell_suggest)
    vim.keymap.set('n', "<leader>ifr", builtin.registers)
    vim.keymap.set('n', "<leader>ifa", builtin.autocommands)
    vim.keymap.set('n', "<leader>if/", builtin.search_history)
    vim.keymap.set('n', "<leader>ift", builtin.tagstack)
    vim.keymap.set('n', "<leader>iF",  builtin.resume)
    vim.keymap.set('n', "<leader>ifc", function() builtin.colorscheme({ enable_preview = true }) end)
    vim.keymap.set('n', "<leader>ifH", builtin.highlights)
    vim.keymap.set('n', "<leader>ifm", builtin.marks)
    vim.keymap.set('n', "<leader>ifp", builtin.pickers)

    -- lsp
    vim.keymap.set('n', "<leader>s", builtin.lsp_document_symbols)
    vim.keymap.set('n', "<leader><leader>s", builtin.lsp_workspace_symbols)

    local function find_config()
        local opts = {
            cwd = "$HOME/.config/nvim/",
            follow = true,
            hidden = true,
        }
        return builtin.find_files(opts)
    end

    vim.keymap.set('n', "<leader>if<leader>", find_config)

    -- custom stuff
    -- local pickers = require "telescope.pickers"
    -- local finders = require "telescope.finders"
    -- local conf = require("telescope.config").values
    -- local actions = require "telescope.actions"
    -- local action_state = require "telescope.actions.state"
    -- local make_entry = require "telescope.make_entry"
end

return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = config,
    },
}
