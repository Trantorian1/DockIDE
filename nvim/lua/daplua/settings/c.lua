-- dependencies
local plugins = require "core.plugins"

local M = {}

-- makes sure nvim dap is loaded
if not plugins.dap.dap.loaded then
	return M
end

local codelldb = "/home/eliot/Documents/code/lua/Brazier/lua/user/dap/debuggers/codelldb/extension/adapter/codelldb"

function M.setup()
	-- require('dap').adapters.codelldb = {
	-- 	type = "server",
	-- 	port = "${port}",
	-- 	executable = {
	-- 		command = codelldb,
	-- 		args = { "--port", "${port}" },
	-- 	},
	-- }

	-- plugins.dap.dap.configurations.cpp = {
	-- 	{
	-- 		name = 'Launch',
	-- 		type = 'codelldb',
	-- 		request = 'launch',
	-- 		program = function()
	-- 			return vim.fn.input(
	-- 				"Path to executable: ", vim.fn.getcwd() .. '/', 'file')
	-- 		end,
	-- 		cwd = '${workspaceFolder}',
	-- 		stopOnEntry = false,
	-- 	}
	-- }
	--
	-- plugins.dap.dap.configurations.c = plugins.dap.dap.configurations.cpp
	--
	-- plugins.dap.dap.configurations.rust = plugins.dap.dap.configurations.cpp
end

return M
