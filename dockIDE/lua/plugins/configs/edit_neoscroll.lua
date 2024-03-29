-- dependencies
local plugins = require("core.plugins")

if not plugins.edit.neoscroll["loaded"] then
	return
end

plugins.edit.neoscroll.setup {
	-- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<S-<Up>>', '<S-<Down>>'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
}
