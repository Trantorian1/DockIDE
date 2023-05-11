-- dependecies
local plugins = require "core.plugins"

local M = { setup = function() end }

if not plugins.dap.mason.dap["loaded"] then
	return
end

function M.setup()
	-- sets up debuggers
	require("daplua.settings.c").setup()

	-- breakpoint
	vim.fn.sign_define(
		'DapBreakpoint',
		{
			text = '🔴',
			texthl='',
			linehl='',
			numhl=''
		}
	)

	-- conditional breakpoint
	vim.fn.sign_define(
		'DapBreakpointCondition',
		{
			text = '🔵',
			texthl='',
			linehl='',
			numhl=''
		}
	)

	-- stopped sign (current execution line)
	vim.fn.sign_define(
		'DapStopped',
		{
			text = '🔸',
			texthl='',
			linehl='',
			numhl=''
		}
	)
end

return M
