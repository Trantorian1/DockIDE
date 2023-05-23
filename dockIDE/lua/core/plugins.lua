local function require_plugin(plugin_name)
	local loaded, plugin = pcall(require, plugin_name)

	if not loaded then
		plugin = {}
		plugin["loaded"] = false
	else
		plugin["loaded"] = true
	end

	return plugin
end

local M = {}

M.color = {
	edge = require_plugin("edge")
}

M.ui = {
	toggleterm = require_plugin('toggleterm'),
	lualine = require_plugin('lualine'),
	virt_column = require_plugin("virt-column"),
	telescope = require_plugin("telescope"),
	legendary = require_plugin("legendary"),
	indent_blankline = require_plugin("indent_blankline"),
	cursorline = require_plugin("nvim-cursorline"),
	statuscol = require_plugin("statuscol"),
	no_neck_pain = require_plugin("no-neck-pain"),
	navic = require_plugin("nvim-navic"),
	navbuddy = {
		core = require_plugin("nvim-navbuddy"),
		actions = require_plugin("nvim-navbuddy.actions")
	},
	treesitter = {
		configs = require_plugin("nvim-treesitter.configs")
	},
	nvim_tree = {
		core = require_plugin('nvim-tree'),
		api = require_plugin('nvim-tree.api')
	},
	trouble = require_plugin("trouble")
}

M.edit = {
	smart_splits = require_plugin("smart-splits"),
	autopairs = require_plugin("nvim-autopairs"),
	neogen = require_plugin("neogen");
	twilight = require_plugin("twilight"),
	autosave = require_plugin("auto-save"),
	backseat = require_plugin("backseat"),
	comment = {
		core = require_plugin("Comment"),
		api = require_plugin("Comment.api"),
	}
}

M.linting = {
	null_ls = require_plugin("null-ls")
}

M.lsp = {
	lspkind = require_plugin("lspkind"),
	cmp = {
		core = require_plugin("cmp"),
		lsp = require_plugin("cmp_nvim_lsp")
	},
	luasnip = {
		core = require_plugin("luasnip"),
		loaders = {
			vs_code = require_plugin("luasnip.loaders.from_vscode")
		}
	},
	mason = {
		core = require_plugin("mason"),
		lsp = require_plugin("mason-lspconfig"),
	},
	lspconfig = require_plugin("lspconfig"),
	todo_comments = require_plugin("todo-comments"),
}

M.dap = {
	mason = {
		dap = require_plugin('mason-nvim-dap')
	},
	dap = require_plugin('dap'),
	ui = require_plugin('dapui')
}

M.git = {
	gitsigns = require_plugin("gitsigns")
}

return M
