-- dependencies
local plugins = require "core.plugins"

if not plugins.edit.autopairs["loaded"] then
    return
end

plugins.edit.autopairs.setup {
    -- sets up treesitter to check for a pair
	ts_enable = true,

	-- directly from the github readme
	ts_config = {
		lua = {'string'},
        javascript = {'template_string'},
        java = false,
	},

	-- enables fast wrap
    fast_wrap = {
		map = '<M-e>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = 'Search',
		highlight_grey='Comment'
	}
}