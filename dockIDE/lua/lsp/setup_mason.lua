-- dependencies
local plugins = require "core.plugins"

-- makes sure mason is loaded
if not plugins.lsp.mason.core.loaded then
	return
end

-- sets up mason
plugins.lsp.mason.core.setup {

}
