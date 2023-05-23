local M = {}

M.setup = function()
	-- coloschemes
	require "plugins.configs.color_edge"

	-- ui plugins
	require "plugins.configs.ui_lualine"
	require "plugins.configs.ui_treesitter"
	require "plugins.configs.ui_indent_blankline"
	require "plugins.configs.ui_cursorline"
	require "plugins.configs.ui_virt_column"

	-- edit plugins
	require "plugins.configs.edit_autopairs"
	require "plugins.configs.edit_comment"
	require "plugins.configs.edit_visual_multi"

	-- lsp plugins
	require "plugins.configs.lsp_cmp"
end

return M
