local M = {}

function M.setup()
	require "daplua.setup_mason"
	require("daplua.setup_extensions").setup()
	require("daplua.setup_dap").setup()
end

return M
