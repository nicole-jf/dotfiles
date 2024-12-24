local hl = vim.api.nvim_set_hl

local colors = {
    black =       "#000000",
    bg0 =         "#111111",
    bg1 =         "#222222",
    bg2 =         "#383838",
    bg3 =         "#525252",
    bg_d =        "#1b1b2b",
    bg_blue =     "#9191df",
    bg_yellow =   "#dfdf91",
    fg =          "#dcdcdc",
    purple =      "#bf8dff", --"#dd55dd",
    green =       "#73ce66", --"#55dd55",
    orange =      "#fd975a", --"#fd9744",
    blue =        "#78aaff", --"#6464fd",
    yellow =      "#ddd363", --"#eded44",
    cyan =        "#65c8d6", --"#55dddd",
    red =         "#ff6c6f",
    grey =        "#888888",
    light_grey =  "#bbbbbb",
    dark_gray=    "#444444",
    dark_cyan =   "#108a8a",
    dark_red =    "#8a2020",
    dark_yellow = "#abab34",
    dark_purple = "#8b348b",
    br_yellow =   "#eded44",
    diff_add =    "#348b34",
    diff_delete = "#8b3434",
    diff_change = "#34348b",
    diff_text =   "#274964",
}

-- hl(<namespace_id>, <highlight_group>, <value>})
hl(0, "Normal",			{fg = colors.fg, bg = colors.bg0})
vim.cmd.hi("clear")
hl(0, "IncSearch",		{fg = colors.orange, bg = none, reverse = true})
hl(0, "CurSearch",		{fg = colors.br_yellow, bg = none, reverse = true})
hl(0, "Search",			{fg = colors.yellow, bg = none, reverse = true})
hl(0, "QuickFixLine",	{link = Search})
hl(0, "Visual",			{fg = none, bg = colors.bg2})
hl(0, "MatchParen",		{fg = colors.br_yellow, bg = colors.bg2, bold = true})
hl(0, "Cursor",			{fg = colors.fg, bg = none, reverse = true})
hl(0, "lCursor",		{link = Cursor})
hl(0, "CursorLine",		{fg = none, bg = colors.bg1})
hl(0, "CursorColumn",	{fg = none, bg = colors.bg1})
hl(0, "Folded",			{fg = none, bg = colors.bg1})
hl(0, "ColorColumn",	{fg = none, bg = colors.bg2})
hl(0, "LineNr",			{fg = colors.bg3, bg = colors.bg0})
hl(0, "CursorLineNr",	{fg = colors.light_grey, bg = colors.bg2})
hl(0, "Whitespace",		{fg = colors.bg2})
hl(0, "String",			{fg = colors.green})
hl(0, "Statement",		{fg = colors.purple, bold = true})
hl(0, "NonText",		{fg = colors.bg2, bg = colors.bg0})
hl(0, "Pmenu",			{fg = colors.fg, bg = colors.bg1})
hl(0, "PmenuSel",		{fg = colors.fg, bg = colors.bg3})

-- Treesitter
hl(0, "@keyword",			{fg = colors.purple, bold = true})
hl(0, "@conditional",		{fg = colors.purple, bold = true})
hl(0, "@comment",			{fg = colors.grey})
hl(0, "@field",				{fg = colors.red})
hl(0, "@parameter",			{fg = colors.red})
hl(0, "@number",			{fg = colors.yellow})
hl(0, "@boolean",			{fg = colors.yellow})
hl(0, "@constructor",		{fg = colors.yellow, bold = true})
hl(0, "@variable",			{fg = colors.red})
hl(0, "@function",			{fg = colors.blue})
hl(0, "@method",			{fg = colors.blue})
hl(0, "@function.builtin",	{fg = colors.cyan})
hl(0, "@keyword.operator",	{link = Normal})
hl(0, "@operator",			{link = Normal})
hl(0, "@punctuation",		{link = Normal})

-- Rainbow delimeters
hl(0, "RainbowDelimiterYellow", {fg = colors.yellow, bold = true})
hl(0, "RainbowDelimiterBlue", {fg = colors.blue, bold = true})
hl(0, "RainbowDelimiterRed", {fg = colors.red, bold = true})
hl(0, "RainbowDelimiterGreen", {fg = colors.green, bold = true})
hl(0, "RainbowDelimiterOrange", {fg = colors.orange, bold = true})
hl(0, "RainbowDelimiterViolet", {fg = colors.purple, bold = true})
hl(0, "RainbowDelimiterCyan", {fg = colors.cyan, bold = true})

-- Lualine
hl(0, "lualine_c_insert",		{fg = colors.grey, bg = colors.bg3})
hl(0, "lualine_b_insert",		{fg = colors.grey, bg = colors.bg3})
hl(0, "lualine_a_replace",		{fg = colors.bg1, bg = colors.red})

