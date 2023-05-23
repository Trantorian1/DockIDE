-- dependecies
local plugins = require "core.plugins"

-- mkaes sure trouble is loaded
if not plugins.ui.trouble["loaded"] then
	return
end

-- sets up trouble
plugins.ui.trouble.setup {

}
