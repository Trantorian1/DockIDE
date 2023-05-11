-- depdendencies
local plugins = require "core.plugins"

-- makes sure backseat is loaded
if not plugins.edit.backseat["loaded"] then
	return
end

-- sets up backseat plugin
plugins.edit.backseat.setup {
	openai_api_key = "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",
	openai_model_id = "gpt-3.5-turbo",
	highlight = {
		icon = ""
	}
}
