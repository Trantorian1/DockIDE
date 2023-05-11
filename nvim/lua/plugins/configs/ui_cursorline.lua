-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.cursorline["loaded"] then
    return
end

plugins.ui.cursorline.setup {
    cursorline = {
			enable = true,
			timeout = 1000,
			number = false,
		},
		cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
}