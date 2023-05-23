local M = {}

M.setup = function()
	-- coloschemes
	require "plugins.configs.color_edge"

	-- ui plugins
	require "plugins.configs.ui_nvim_tree"
	require "plugins.configs.ui_lualine"
	require "plugins.configs.ui_treesitter"
	require "plugins.configs.ui_toggleterm"
	require "plugins.configs.ui_telescope"
	require "plugins.configs.ui_legendary"
	require "plugins.configs.ui_indent_blankline"
	require "plugins.configs.ui_cursorline"
	require "plugins.configs.ui_virt_column"
	require "plugins.configs.ui_navic"
	require "plugins.configs.ui_trouble"

	-- edit plugins
	require "plugins.configs.edit_smart_splits"
	require "plugins.configs.edit_autopairs"
	require "plugins.configs.edit_comment"
	require "plugins.configs.edit_visual_multi"
	require "plugins.configs.edit_neogen"
	require "plugins.configs.edit_backseat"
	-- require "plugins.configs.edit_autosave"

	-- git plugins
	require "plugins.configs.git_gitsigns"

	-- lsp plugins
	require "plugins.configs.lsp_cmp"
	require "plugins.configs.lsp_todo_comments"
end

return M
