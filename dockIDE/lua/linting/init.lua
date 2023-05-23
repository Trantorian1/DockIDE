local M = {}

function M.setup()
	require 'linting.setup_null_ls'
	-- registers all linters
	require 'linting.linters'
end

return M
