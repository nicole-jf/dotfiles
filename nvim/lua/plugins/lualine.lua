return {
    'nvim-lualine/lualine.nvim',
--    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = { left = '│', right = '│'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {{'filename', path = 1}},
    lualine_b = {'diagnostics'},
    lualine_c = {'branch', 'diff'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

    end
}
