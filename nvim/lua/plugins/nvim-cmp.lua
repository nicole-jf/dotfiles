return {}
--return {
--    "hrsh7th/nvim-cmp",
--    dependencies = 
--        {'hrsh7th/cmp-nvim-lsp',
--            dependencies = {'neovim/nvim-lspconfig'}},
--        {'hrsh7th/cmp-path'},
--        {'hrsh7th/cmp-buffer'},
--        {'hrsh7th/cmp-nvim-lua'},
--        {'hrsh7th/cmp-cmdline'},
--    config = function()
--        local cmp = require'cmp'
--        require('cmp').setup({
--            mapping = cmp.mapping.preset.insert({
--                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--                ['<C-f>'] = cmp.mapping.scroll_docs(4),
--                ['<C-Space>'] = cmp.mapping.complete(),
--                ['<C-e>'] = cmp.mapping.abort(),
--                ['<CR>'] = cmp.mapping.confirm({select = true}),
--                ['<C-f>'] = cmp.mapping.confirm({select = true}),
--            }),
--            sources = cmp.config.sources({
--                {name = 'nvim_lsp'},
--                {name = 'nvim_lua'},
--                {name = 'luasnip'},
--                {name = 'path'},
--                {name = 'buffer'},
--            })
--          })
--    end
--}f
