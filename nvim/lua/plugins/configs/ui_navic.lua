-- dependencies
local plugins = require "core.plugins"

-- makes sure nvim-navic is loaded
if not plugins.ui.navic["loaded"] then
	return
end

plugins.ui.navic.setup {
	icons = {
		File = ' ',
		Module = ' ',
		Namespace = ' ',
		Package = ' ',
		Class = ' ',
		Method = ' ',
		Property = ' ',
		Field = ' ',
		Constructor = ' ',
		Enum = ' ',
		Interface = ' ',
		Function = ' ',
		Variable = ' ',
		Constant = ' ',
		String = ' ',
		Number = ' ',
		Boolean = ' ',
		Array = ' ',
		Object = ' ',
		Key = ' ',
		Null = ' ',
		EnumMember = ' ',
		Struct = ' ',
		Event = ' ',
		Operator = ' ',
		TypeParameter = ' '
	},
	highlight = true,
    separator = " > ",
}
