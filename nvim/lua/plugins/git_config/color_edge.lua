-- depdendencies
local plugins = require "core.plugins"

-- if not plugins.color.edge.loaded then
--     return
-- end

vim.cmd("let g:edge_dim_foreground=1")
vim.cmd("let g:edge_enable_italic=1")
vim.cmd("colorscheme edge")