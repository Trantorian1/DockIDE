-- dependencies
local plugins = require "core.plugins"

-- makes sure mason-lsp is loaded
if not plugins.lsp.mason.lsp.loaded then
	return
end
-- sets up mason-lsp
plugins.lsp.mason.lsp.setup {
	ensure_installed = { "clangd", "lua_ls" }
}
