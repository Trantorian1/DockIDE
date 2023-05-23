-- ============================================================================
-- 								SETS UP NULL-LS
-- ============================================================================

-- dependencies
local plugins = require 'core.plugins'

-- makes sure null-ls is loaded for lsp
if not plugins.linting.null_ls ["loaded"]then
	return
end

-- disables null_ls for test files
local function should_attach(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if (string.match(bufname, 'test.*')) then
		return false
	end
	return true
end

-- null-ls setup
plugins.linting.null_ls.setup {
	debounce = 10,
	should_attach = should_attach
}
