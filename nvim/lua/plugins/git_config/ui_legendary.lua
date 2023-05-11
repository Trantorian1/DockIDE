-- dependencies
local plugins = require "core.plugins"
local pickers = require "core.pickers"

if not plugins.ui.legendary["loaded"] then
    return
end

-- mapping options
local mapping_opts = {
	noremap = true,	-- defines mapping type and avoid recursive mappings
	silent = true	-- does not display output associated to inputing command
}

-- mapping modes
local NORMAL = "n"
local VISUAL = "v"
local TERMINAL = 't'

plugins.ui.legendary.setup {
    ignore_builtin = false,

    keymaps = {
		-- ====================================================================
		-- 								 RESIZING
		-- ====================================================================
		-- horizontal
		{
			'<C-S-Right>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_right(2)
			end,
			description = '[UI] Expands window horizontally',
			mode = { NORMAL },
			opts = mapping_opts
		},
		{
			'<C-S-Left>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_left(2)
			end,
			description = '[UI] Shrinks window horizontally',
			mode = { NORMAL },
			opts = mapping_opts
		},
		-- vertical
		{
			'<C-S-Up>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_up(2)
			end,
			description = '[UI] Shrinks window vertically',
			mode = { NORMAL },
			opts = mapping_opts
		},
		{
			'<C-S-Down>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.resize_down(2)
			end,
			description = '[UI] Expands window vertically',
			mode = { NORMAL },
			opts = mapping_opts
		},
		-- ====================================================================
		-- 								 NAVIGATION
		-- ====================================================================
		-- move to right window
		{
			'<S-Right>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_right()
			end,
			description = '[NAV] Moves cursor to right window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to left window
		{
			'<S-Left>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_left()
			end,
			description = '[NAV] Moves cursor ot the left window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to the upper window
		{
			'<S-Up>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_up()
			end,
			description = '[NAV] Moves cursor to the top window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},
		-- move to the lower window
		{
			'<S-Down>',
			function ()
				if not plugins.edit.smart_splits.loaded then
					return
				end
				plugins.edit.smart_splits.move_cursor_down()
			end,
			description = '[NAV] Moves cursor to the bottom window',
			mode = { NORMAL, TERMINAL },
			opts = mapping_opts
		},

		-- ====================================================================
		-- 								 FINDERS
		-- ====================================================================
        -- file search
		{
        	[[<S-f>f]],
            function()
				require("telescope.builtin").find_files(pickers.sleek)
            end,
            mode = NORMAL,
            opts = mapping_opts
        },
		-- git file search
		{
        	[[<S-f>g]],
            function()
				require("telescope.builtin").git_files(pickers.sleek)
            end,
            mode = NORMAL,
            opts = mapping_opts
        },
		-- command search
		{
			[[<S-f>c]],
			function ()
				vim.cmd [[Legendary]]
			end,
			description = '[FIND] Opens Legendary command explorer',
			mode = { NORMAL },
			opts = mapping_opts
		},

		-- ====================================================================
		-- 								    UI
		-- ====================================================================
		-- file tree
		{
			[[<A-1>]],
			function()
				vim.cmd("NvimTreeFocus")
			end,
			description = '[UI] Toggle file tree',
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- terminal
		{
			[[<A-2>]],
			function()
				require("core.ui").open_term()
			end,
			description = '[UI] Toggles a terminal instante',
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lazygit
		{
			[[<A-3>]],
			function()
				vim.cmd("LazyGit")
			end,
			description = '[UI] Toggles a lazygit instance',
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- navbuddy
		{
			[[<A-0>]],
			function()
				vim.cmd("Navbuddy")
			end,
			description = '[UI] Toggles navigation ui',
			modes = { NORMAL },
			opts = mapping_opts
		},

		-- ====================================================================
		-- 								   LSP
		-- ====================================================================
		-- lsp definition
		{
			[[<S-l>d]],
			function() vim.lsp.buf.definition() end,
			description = '[LSP] Go to keyword definition',
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lsp implementation
		{
			[[<S-l>i]],
			function() vim.lsp.buf.implementation() end,
			description = "[LSP] List keyword implementations",
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lsp rename
		{
			[[<S-l>r]],
			function() vim.lsp.buf.rename() end,
			description = "[LSP] Rename keyword",
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lsp code action
		{
			[[<S-l>a]],
			function() vim.lsp.buf.code_action() end,
			description = "[LSP] Display code action",
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lsp hover
		{
			[[<S-l>h]],
			function() vim.lsp.buf.hover() end,
			description = "[LSP] Display hover information",
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- lsp diagnostics
		{
			[[<S-l>e]],
			function() vim.diagnostic.open_float() end,
			description = "[LSP] Display hover diagnostics",
			modes = { NORMAL },
			opts = mapping_opts
		},

		-- ====================================================================
		-- 									EDITING
		-- ====================================================================	
		-- indent right
		{
			'>',
			'>gv',
			description = '[EDIT] Indent selection right',
			mode = { VISUAL },
			opts = mapping_opts
		},
		-- indent left
		{
			'<',
			'<gv',
			description = '[EDIT] Indent selection left',
			mode = { VISUAL },
			opts = mapping_opts
		},
		-- commenting
		{
			[[<S-c>]],
			{
				v = function()
					local esc = vim.api.nvim_replace_termcodes(
						'<ESC>', true, false, true
					)

					vim.api.nvim_feedkeys(esc, 'nx', false)
					plugins.edit.comment.api.toggle.linewise(vim.fn.visualmode())
				end,
				n = function()
					plugins.edit.comment.api.toggle.linewise.current()
				end,
			},
			description = '[EDIT] Toggle comment',
			opts = mapping_opts
		},
		-- documenting
		{
			[[<S-d>]],
			function()
				vim.cmd [[Neogen]]
			end,
			description = "[EDIT] Doccument selection",
			modes = { NORMAL },
			opts = mapping_opts
		},
		-- zen mode
		{
			[[<S-z>]],
			function()
				vim.cmd [[ZenMode]]
			end,
			description = "[EDIT] Activate zen mode",
			modes = { NORMAL },
			opts = mapping_opts
		}
    }
}
