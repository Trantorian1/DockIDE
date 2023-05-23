-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.toggleterm["loaded"] then
    return
end

plugins.ui.toggleterm.setup {
	direction = "horizontal",
	size = 10,
	start_in_insert = true,
	close_on_exit = true
}
