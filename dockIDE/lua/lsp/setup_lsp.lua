-- dependencies
local plugins = require "core.plugins"

-- make sure lspconfig is loaded
if not plugins.lsp.lspconfig.loaded then
	return
end

-- ============================================================================
-- 									  LSP UI
-- ============================================================================

-- signes used by lsp for diagnostics
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

-- sets up the signs
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, {
		texthl = sign.name, text = sign.text, numhl = ""
	})
end

-- config for vim diagnostics
local config = {
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
		header = "",
		prefix = "",
	},
}

-- applies config
vim.diagnostic.config(config)

-- ============================================================================
-- 									LSP SERVERS
-- ============================================================================

-- sets up lsp servers
plugins.lsp.mason.lsp.setup_handlers {
	-- default handler
	function(server_name)
		-- global options for every language server
		local opts = {
			-- nvim-cmp support
			capabilities = plugins.lsp.cmp.lsp.default_capabilities(),

			-- called whenever a LSP server is attached to a buffer
			on_attach = function (client, bufnr)
				-- sets up navigation capabilities
				local loaded_navic= plugins.ui.navic.loaded
				local loaded_navbuddy = plugins.ui.navbuddy.core.loaded

				-- makes sure navigation plugins are loaded
				if not loaded_navic or not loaded_navbuddy then
					return
				end

				-- attaches navigation plugins to buffer
				plugins.ui.navic.attach(client, bufnr)
				plugins.ui.navbuddy.core.attach(client, bufnr)
				-- lsp_signature.on_attach({
				-- 	bind = true,
				-- 	handler_opts = {
				-- 		border = 'rounded'
				-- 	}
				-- }, bufnr)
			end
		}

		-- options specific to sumneko_lua
		-- if server_name == 'sumneko_lua' then
		-- 	local sumneko_opts = require('user.lsp.settings.sumneko_lua')
		-- 	opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
		-- end

		-- sets up the server with the correct options
		plugins.lsp.lspconfig[server_name].setup(opts)
	end,
}
