-- LSP servers and clients communicate which features they support through 'capabilities'.
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

 -- example calling setup directly for each LSP
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        lspconfig['rust_analyzer'].setup({ 
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ['rust-analyzer'] = {
                    imports = {
                        granularity = {
                            group = 'module',
                        },
                        prefix = 'self',
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                    check = {
                        command = 'clippy',
                    },
                },
            },
        })
    end
}
