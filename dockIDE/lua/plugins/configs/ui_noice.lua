-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.noice["loaded"] then
    return
end

plugins.ui.noice.setup {
    views = {
        cmdline_popup = {
            border = {
                style = "none",
                padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
    }
}