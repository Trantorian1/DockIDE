local plugins = require "core.plugins"

local M = { setup = function() end }

if not plugins.dap.dap["loaded"] then
	return M
end

if not plugins.dap.ui["loaded"] then
	return M
end

function M.setup()
	plugins.dap.dap.listeners.after.event_initialized["dapui_config"] = function()
		plugins.dap.ui.open()
	end
	plugins.dap.dap.listeners.before.event_terminated["dapui_config"] = function()
		plugins.dap.ui.close()
	end
	plugins.dap.dap.listeners.before.event_exited["dapui_config"] = function()
		plugins.dap.ui.close()
	end
	local dap, dapui = require("dap"), require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
	  dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
	  dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
	  dapui.close()
	end
end

return M
