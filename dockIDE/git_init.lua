vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local path_IDE = debug.getinfo(1).source:match("@?(.*/)"):sub(1, -2)

-- adds Ignite path to vim's runtimepaths
if not vim.tbl_contains(vim.opt.runtimepath:get(), path_IDE) then
	vim.opt.rtp:append(path_IDE)
end

local lazy    = require "plugins.lazy"
local options = require "vim_opt.options"
local configs = require "plugins.git_config"
local hl      = require "vim_opt.highlights"
local lsp     = require "lsp"

lazy   .setup(path_IDE)
options.setup()
configs.setup()
hl     .setup()
lsp    .setup()

if vim.g.neovide then
	require("neovide").setup()
end
