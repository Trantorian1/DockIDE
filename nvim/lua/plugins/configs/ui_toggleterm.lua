-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.toggleterm["loaded"] then
    return
end

local function term_size(term)
	if term.direction == "horizontal" then
		return vim.o.lines * 0.2
	elseif term.direciton == "vertical" then
		return vim.o.columns * 0.4
	end
end

plugins.ui.toggleterm.setup {
	-- open_mapping = [[<A>t]],
	direction = "horizontal",
	size = term_size,
	start_in_insert = true,
	close_on_exit = true
}
