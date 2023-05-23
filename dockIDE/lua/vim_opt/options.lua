local options = {
	-- mouse options
	mouse = "a",		-- sets mouse to be usable in all modes
	cursorline = true,	-- displays a line under currently selected line
	scrolloff = 8,		-- allways displays 8 lines above and below cursor
	sidescrolloff = 8,	-- same as scrolloff but horizontally

	-- line number options
	number = true,		-- displays the current line number
	relativenumber = true,	-- displays line numbers relative to current line
	colorcolumn = "80",	-- displays ruler at 80 characters
	numberwidth = 2,	-- by default displays 2 digits in the line number

	-- indentation options
	tabstop = 4,		-- sets tab size to 4 characters
	shiftwidth = 4,		-- sets autoindentation to match tabs
	smartindent = true,	-- better auto indent

	-- line wrapping options
	textwidth = 80,		-- numbers of characters allowed per line

	-- clipboard options
	-- uses system clipboard for copy / paste in nvim	
	clipboard = "unnamedplus",

	-- window options
	splitright = true,	-- allways splits windows to the right when v splitting
	splitbelow = true,	-- allways splits windows below when h splitting

	-- delay options
	updatetime = 300,	-- makes autocomplete more responsive
	timeoutlen = 300,	-- max duration waited for a keymap to complete	

	-- display options
	termguicolors = true,

	-- status line options
	laststatus = 0,

}

local M = {}

M.setup = function()
	-- iterates through all options and sets them
	for k, v in pairs(options) do
		vim.opt[k] = v
	end
end

return M
