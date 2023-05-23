local M = {}

M.setup = function()
	require "lsp.setup_mason"
	require "lsp.setup_mason_lsp"
	require "lsp.setup_lsp"
end

return M
