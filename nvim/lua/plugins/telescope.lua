return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        -- Telescope mappings
        local builtin = require('telescope.builtin')
        local themes = require('telescope.themes')

        vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>g', function() builtin.live_grep(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>h', function() builtin.help_tags(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>r', function() builtin.oldfiles(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>Y', function() builtin.registers(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>k', function() builtin.keymaps(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>d', function() builtin.diagnostics(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>lt', function() builtin.lsp_type_definitions(themes.get_ivy())end)
        vim.keymap.set('n', '<leader>ld', function() builtin.lsp_definitions(themes.get_ivy())end)


        local telescope = require("telescope")
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)}

        -- I want to search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")
        -- I don't want to search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")

        telescope.setup({
            defaults = {
                -- `hidden = true` is not supported in text grep commands.
                vimgrep_arguments = vimgrep_arguments,
            },
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*",},
                },
            },
        })

        local actions = require "telescope.actions"
        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                    ["<C-u>"] = false
                    },
                },
            },
            pickers = {
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = actions.delete_buffer
                        },
                    },
                },
            },
        }
    end,
}

