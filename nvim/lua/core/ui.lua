-- dependencies
local plugins = require "core.plugins"
local Split = require "nui.split"

if not plugins.ui.nvim_tree.core.loaded then
	return
end

local M = {}

M.terminal = Split {
	relative = "win",
	position = "bottom",
	size = "25%",
	win_options = {
		number = false,
		relativenumber = false,
		cursorline = false,
		cursorcolumn = false,
		spell = false,
		list = false,
		colorcolumn = "0",
	}
}

-- Custom function to achieve the desired layout using nvim-tree API
M.open_term = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_set_current_buf(bufnr)

	M.terminal:mount()

	vim.cmd("term")
	vim.cmd("startinsert")
end

return M
