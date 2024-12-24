-- Setting <Leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap ("n", "<leader>t", '<cmd>split<CR><cmd>te<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "<leader>T", '<cmd>vsplit<CR><cmd>te<CR>', {noremap=true, silent=true})

-- Since C-h in insert mode is backspace, I had this idea, C-l to Del
vim.api.nvim_set_keymap ("i", "<C-l>", '<Del>', {noremap=true, silent=false})
vim.api.nvim_set_keymap ("c", "<C-l>", '<Del>', {noremap=true, silent=false})

-- Alt + < up or down motion key > to move line up or down in normal mode
vim.api.nvim_set_keymap ("n", "<A-k>", '<cmd>move -2<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "<A-j>", '<cmd>move +1<CR>', {noremap=true, silent=true})

-- Alt + < up or down motion key > to move selected lines up or down in Visual line mode
vim.api.nvim_set_keymap ("v", "<A-j>", 'xp`[V`]', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("v", "<A-k>", 'xkP`[V`]', {noremap=true, silent=true})

-- "generic readline" in insert mode
vim.api.nvim_set_keymap ("i", "<C-BS>", '<C-o>db', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("i", "<C-Del>", '<C-o>dw', {noremap=true, silent=true})

-- Vertical window splits with the same binding as horizontal splits + Shift
vim.api.nvim_set_keymap ("n", "<C-w>N", '<cmd>vnew<CR>', {noremap=true, silent=true})

-- System clipboard related bindings
vim.api.nvim_set_keymap ("v", "<leader>y", '"+y', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "<leader>yy", '"+yy', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "<leader>p", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "<leader>P", '"+P', {noremap=true, silent=true})

-- somewhat more intuitive binding to exit terminal mode
vim.api.nvim_set_keymap ("t", "<C-\\><Esc>", '<C-\\><C-n>', {noremap=true, silent=true})

-- some bindings from tpope's unimpaired
vim.api.nvim_set_keymap ("n", "]a", '<cmd>next<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "[a", '<cmd>previous<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "]b", '<cmd>bnext<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap ("n", "[b", '<cmd>bprevious<CR>', {noremap=true, silent=true})
