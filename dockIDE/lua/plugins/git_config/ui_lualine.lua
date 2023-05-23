-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.lualine.loaded then
    return
end


local navic = function()
	-- if navic.loaded and navic.is_available() then
	if plugins.ui.navic["loaded"]then
		return plugins.ui.navic.get_location()
	end
end

plugins.ui.lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
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
    winbar = {
		-- lualine_a = {
		-- 	{
		-- 		navic,
		-- 		separator = { left = '', right = ''}
		-- 	}
		-- }
	},
    inactive_winbar = {},
    extensions = {'nvim-tree', 'toggleterm'}
}
