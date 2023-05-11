-- dependencies
local plugins = require "core.plugins"

if not plugins.dap.mason.dap["loaded"] then
	return
end

-- sets up mason dap
plugins.dap.mason.dap.setup {
	ensure_installed = { 'codelldb' },
	handlers = {
		function(config)
			plugins.dap.mason.dap.default_setup(config)
		end,
		codelldb = function(config)
			config.adapters = {
				type = "server",
				port = "${port}",
				executable = {
					command = "codelldb",
					args = { "--port", "${port}" },
				},
			}
			plugins.dap.mason.dap.default_setup(config)
		end
	},
}

-- require('dap').adapters.codelldb = {
-- 	type = "server",
-- 	port = "${port}",
-- 	executable = {
-- 		command = codelldb,
-- 		args = { "--port", "${port}" },
-- 	},
-- }
