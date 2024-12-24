require('remaps')		-- ~/.config/nvim/lua/remaps.lua
require('vimoptions')	-- ~/.config/nvim/lua/vimoptions.lua
require('autocmd')		-- ~/.config/nvim/lua/autocmd.lua
require('colors')		-- ~/.config/nvim/colors/colors.lua

-- Plugins with lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {import = "plugins"}, -- ~/.config/nvim/lua/plugins/
})
