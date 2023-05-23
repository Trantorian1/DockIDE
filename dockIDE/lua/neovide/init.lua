local M = {}

M.setup = function()
	vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_fullscreen = true
end

return M
