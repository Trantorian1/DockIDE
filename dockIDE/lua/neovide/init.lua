local M = {}

M.setup = function()
	vim.o.guifont = "Monospace:h10"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = true
end

return M
