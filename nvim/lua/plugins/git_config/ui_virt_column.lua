-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.virt_column["loaded"] then
    return
end

plugins.ui.virt_column.setup {
    char = '│'
}