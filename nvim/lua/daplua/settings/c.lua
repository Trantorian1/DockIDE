-- dependencies
local plugins = require "core.plugins"

local M = {}

-- makes sure nvim dap is loaded
if not plugins.dap.dap.loaded then
	return M
end

function M.setup()
	plugins.dap.dap.adapters.cppdbg = {
		id = 'cppdbg',
		type = 'executable',
		command = '/root/.local/share/nvim/mason/bin/OpenDebugAD7'
	}
	plugins.dap.dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopAtEntry = false,
			setupCommands = {
				{
					text = '-enable-pretty-printing',
					description =  'enable pretty printing',
					ignoreFailures = false
				},
			},
		},
	}
	require('dap').configurations.c = plugins.dap.dap.configurations.cpp
	require('dap').configurations.rust = plugins.dap.dap.configurations.cpp
end

return M
