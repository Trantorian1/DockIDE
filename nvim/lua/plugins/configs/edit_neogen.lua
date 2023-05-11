-- dependencies
local plugins = require "core.plugins"

-- makes sure neogen plugin is loaded
if not plugins.edit.neogen["loaded"] then
	return
end

-- neogen setup
plugins.edit.neogen.setup {

}
