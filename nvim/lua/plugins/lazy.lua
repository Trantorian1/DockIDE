local M = {}

local plugins = {

	-- DEPENDENCIES
	'stevearc/dressing.nvim',
	'nvim-tree/nvim-web-devicons',
	'MunifTanjim/nui.nvim',
	'nvim-lua/plenary.nvim',

	-- COLORSCHEMES
	'sainnhe/edge',

	-- UI
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	'nvim-telescope/telescope.nvim',
	'mrjones2014/legendary.nvim',
	'lukas-reineke/indent-blankline.nvim',
	'p00f/nvim-ts-rainbow',
	'yamatsum/nvim-cursorline',
	'folke/zen-mode.nvim',
	'lukas-reineke/virt-column.nvim',
	'akinsho/toggleterm.nvim',
	'nvim-treesitter/nvim-treesitter-context',
	{
		'SmiteshP/nvim-navic',
		dependencies = 'neovim/nvim-lspconfig'
	},
	{
		'utilyre/barbecue.nvim',
		name = "barbecue",
		dependencies = {
			'SmiteshP/nvim-navic',
    		'nvim-tree/nvim-web-devicons'
		},
		opts = {}
	},
	{
		'folke/trouble.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	-- EDIT
	'mrjones2014/smart-splits.nvim',
	'windwp/nvim-autopairs',
	'numToStr/Comment.nvim',
	'mg979/vim-visual-multi',
	'danymat/neogen',
	'42Paris/42header',
	'ziontee113/icon-picker.nvim',
	'james1236/backseat.nvim',

	-- LINTING
	'jose-elias-alvarez/null-ls.nvim',

	-- LSP
	'rafamadriz/friendly-snippets',
	'hrsh7th/nvim-cmp',
	'saadparwaiz1/cmp_luasnip',
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp"
	},
	'onsails/lspkind.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	{
		'antosha417/nvim-lsp-file-operations',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-tree.lua'
		}
	},
	{
		'folke/todo-comments.nvim',
		dependencies = 'nvim-lua/plenary.nvim'
	},

	-- DAP
	{
		'mfussenegger/nvim-dap',
	},
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'mfussenegger/nvim-dap'
		}
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = 'mfussenegger/nvim-dap'
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-treesitter/nvim-treesitter'
		}
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-telescope/telescope.nvim',
			'nvim-treesitter/nvim-treesitter'
		}
	},

	-- GIT
	'lewis6991/gitsigns.nvim',
	'kdheepak/lazygit.nvim',
}

local opts = {
	ui = {
		border = "single",
	},
}

M.setup = function(path_IDE)
	local path_lazy = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(path_lazy) then
	  vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		path_lazy,
	  })
	end

	if not vim.tbl_contains(vim.opt.rtp:get(), path_lazy) then
		vim.opt.rtp:append(path_lazy)
	end

	require("lazy").setup(plugins, opts)

	vim.opt.rtp:append(path_IDE)
end

return M
