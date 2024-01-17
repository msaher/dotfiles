return {

    {
        "dpayne/CodeGPT.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require("codegpt.config")
            vim.g["codegpt_openai_api_key"] = os.getenv("OPENAI_API_KEY")
        end
    },

    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
                api_key_cmd = "printf '%s' $OPENAI_API_KEY",
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    }

}
