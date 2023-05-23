-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.telescope["loaded"] then
    return {}
end

local M = {}

M.sleek = require('telescope.themes').get_dropdown({
        previewer = false;
        borderchars = {
            prompt = {'─', '│', '─', '│', '┌', '┐', '┘', '└' },
            results = {' ', '│', '─', '│', '│', '│', '┘', '└' }
        }});

return M