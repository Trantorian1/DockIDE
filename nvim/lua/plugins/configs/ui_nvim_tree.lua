-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.nvim_tree.core.loaded then
	return
end

plugins.ui.nvim_tree.core.setup {

	disable_netrw = true,
	hijack_cursor = true,
	sort_by = "case_sensitive",

	view = {
		width = 30,
		side = "left",
		relativenumber = true,
	},

	renderer = {
		group_empty = true,
	},

	filters = {
		dotfiles = false,
	},
}

local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
