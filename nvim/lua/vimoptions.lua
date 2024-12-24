-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4

-- Set cursor
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25,r-cr-v:hor20,o:hor50,a:blinkwait50-blinkoff100-blinkon100-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Relative Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.signcolumn = "yes"

-- Color Collum to show maximum line length
vim.wo.colorcolumn = '100'

vim.wo.cursorline = true
-- vim.wo.cursorcolumn = true

-- Keep cursor in the middle vertically
vim.o.scrolloff = 100

-- Display blank characters
vim.wo.list = true
vim.opt.listchars = {tab = '<->', leadmultispace = '│   ', trail = '·',} -- nbsp = '␣', eol = '↵'}

-- Mouse
vim.opt.mouse = "a"

-- GUI colors
vim.opt.termguicolors = true

-- Disable show mode name in cmd line

-- Save undofile
vim.opt.undofile = true


vim.opt.fillchars:append({ eob = " " })

-- Rightclick PopUp menu tweaking
vim.cmd "aunmenu PopUp.-1-"
vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"

