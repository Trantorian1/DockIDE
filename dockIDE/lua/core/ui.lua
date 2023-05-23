-- dependencies
local plugins = require "core.plugins"

local M = {
	_left = "NONE",
	_right = "NONE",
	_bottom = "NONE"
}

local function module_factory(show, hide, slot)
	local module = {
		_show = show,
		_hide = hide,
		_slot = slot
	}

	return module
end

M.file_tree = module_factory(
	function() vim.cmd [[NvimTreeFocus]] end,
	function() vim.cmd [[NvimTreeClose]] end,
	"LEFT"
)

M.diagnostics = module_factory(
	function() vim.cmd [[Trouble]] end,
	function() vim.cmd [[TroubleClose]] end,
	"BOTTOM"
)

M.terminal = module_factory(
	function()
		if (M.terminal.open == false) then
			M.terminal.open = true
			vim.cmd [[ToggleTerm]]
		end
	end,
	function()
		if (M.terminal.open == true) then
			M.terminal.open = false
			vim.cmd [[ToggleTerm]]
		end
	end,
	"BOTTOM"
)
M.terminal.open = false

M.none = module_factory(
	function() end,
	function() end,
	"NONE"
)

M._left = M.file_tree
M._right = M.none
M._bottom = M.terminal

function M.hide()
	M._right._hide()
	M._left._hide()
	M._bottom._hide()
end

function M.show()
	M._bottom._show()
	M._left._show()
	M._right._show()
end

function M.set_left(module)
	if (module._slot ~= "LEFT") then
		return
	end
	M.hide()
	M._left = module
	M.show()
end

function M.set_right(module)
	if (module._slot ~= "RIGHT") then
		return
	end
	M.hide()
	M._right = module
	M.show()
end

function M.set_bottom(module)
	if (module._slot ~= "BOTTOM") then
		return
	end
	M.hide()
	M._bottom = module
	M.show()
end

return M
