-- dependencies
local plugins = require "core.plugins"

-- makes sure navbuddy plugin is loaded
if not plugins.ui.navbuddy.core["loaded"] then
	return
end

-- local actions = plugins.ui.navbuddy.actions
local actions = require("nvim-navbuddy.actions")

-- sets up navbuddy
plugins.ui.navbuddy.core.setup {
	mappings = {
        ["<esc>"] = actions.close,        -- Close and cursor to original location
        ["q"] = actions.close,

        ["j"] = actions.next_sibling,     -- down
        ["<Down>"] = actions.next_sibling,
        ["k"] = actions.previous_sibling, -- up
        ["<Up>"] = actions.previous_sibling,

        ["h"] = actions.parent,           -- Move to left panel
        ["<Left>"] = actions.parent,
        ["l"] = actions.children,         -- Move to right panel
        ["<Right>"] = actions.children,

        ["v"] = actions.visual_name,      -- Visual selection of name
        ["V"] = actions.visual_scope,     -- Visual selection of scope

        ["y"] = actions.yank_name,        -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope,       -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name,      -- Insert at start of name
        ["I"] = actions.insert_scope,     -- Insert at start of scope

        ["a"] = actions.append_name,      -- Insert at end of name
        ["A"] = actions.append_scope,     -- Insert at end of scope

        ["r"] = actions.rename,           -- Rename currently focused symbol

        ["d"] = actions.delete,           -- Delete scope

        ["f"] = actions.fold_create,      -- Create fold of current scope
        ["F"] = actions.fold_delete,      -- Delete fold of current scope

        ["c"] = actions.comment,          -- Comment out current scope

        ["<enter>"] = actions.select,     -- Goto selected symbol
        ["o"] = actions.select,
    },
}
