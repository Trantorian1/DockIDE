-- dependencies
local plugins = require "core.plugins"

-- makes sure autosave is loaded
if not plugins.edit.autosave["loaded"] then
	return
end

-- sets up autosave
plugins.edit.autosave.setup {
	execution_message = {
		message = function() -- message to print on save
			return ("  ...")
		end,
		dim = 0.18, -- dim the color of `message`
		cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea
		                          -- after displaying `message`. See :h MsgArea
	},
}
