-- dependencies
local plugins = require "core.plugins"

if not plugins.color.github.loaded then
	return
end

plugins.color.github.setup {
	dark_float = true,
	comment_style = "italic",
  	keyword_style = "italic",
  	function_style = "italic",
  	variable_style = "italic",
	theme_style = "dark",
}
