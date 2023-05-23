-- dependencies
local plugins = require "core.plugins"

-- makes sure todo-plugins is loaded
if not plugins.lsp.todo_comments["loaded"] then
	return
end

-- sets up todo-comments
plugins.lsp.todo_comments.setup {

}
