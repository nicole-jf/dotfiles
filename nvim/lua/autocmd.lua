local group = vim.api.nvim_create_augroup("autocmdgroup", {clear = true})
-- Start terminal in insert mode
vim.api.nvim_create_autocmd({"TermOpen",}, {command = "startinsert", group = group})

-- When entering a terminal buffer auto switch to insert mode
-- I could use TermEnter event but it does not work when switching between window splits
vim.api.nvim_create_autocmd({"BufEnter"},
{
    group = group,
    pattern = {"*"},
    callback = function()
        if vim.opt.buftype:get() == "terminal" then
            vim.cmd(":startinsert")
        end
    end
})

-- Supresses "[Process exited 0]" message when closing a terminal buffer
vim.api.nvim_create_autocmd({"TermClose",},
{
    group = group,
    callback = function()
        vim.api.nvim_input("<CR>")
    end
})

