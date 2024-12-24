return {
    'windwp/nvim-autopairs', event = "InsertEnter", opts = {},
    lazy = true,
    config = function()
        require('nvim-autopairs').setup({
            enable_check_bracket_line = false
        })
    end
}

