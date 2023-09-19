-- dependencies
local plugins = require "core.plugins"

if not plugins.dap.ui["loaded"] then
	return
end

plugins.dap.ui.setup {
	layouts = { {
        elements = { {
            id = "scopes",
            size = 1
          } },
        position = "left",
        size = 40
      }, {
        elements = { {
            id = "console",
            size = 1
          } },
        position = "bottom",
        size = 10
      } },
}
