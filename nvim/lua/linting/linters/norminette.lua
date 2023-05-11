-- ============================================================================
-- 							NORMINETTE LINTER SETUP
-- ============================================================================

-- dependencies
local plugins = require 'core.plugins'

-- makes sure null-ls is correctly loaded
if not plugins.linting.null_ls.loaded then
	return
end

-- shorthands
local helpers = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS_ON_SAVE = methods.internal.DIAGNOSTICS_ON_SAVE

-- sets up norminette linter
local norminette = {
    name = 'norminette',
    meta = {
        url = 'https://github.com/42School/norminette',
        description = 'terrible C linter for 42 schools',
        notes = {
            '\'norminette\' will only be run when files are saved to disk',
        },
    },
    method = DIAGNOSTICS_ON_SAVE,
    filetypes = { 'c' },
    generator = helpers.generator_factory {
		command = 'norminette',
		args = {
			'-d',
			'$FILENAME'
		},
		format = 'line',
		from_stderr = true,
		on_output = helpers.diagnostics.from_pattern(
			-- '.+(%d+):(%d+):(.*)$',
			"[^%d]+(%d+)[^%d]+(%d+)%):[%s]+(.*)$",
			{ "row", "col", "message" }
		)
	}
}

-- registers norminette to null-ls
plugins.linting.null_ls.register(norminette)
