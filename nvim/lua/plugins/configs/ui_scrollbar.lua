-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.scrollbar.loaded then
	return
end

plugins.ui.scrollbar.setup {
	handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true,
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
}
