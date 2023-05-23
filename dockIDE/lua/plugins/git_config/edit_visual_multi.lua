-- ============================================================================
--									VISUAL MULTI
-- ============================================================================

vim.api.nvim_set_var('VM_default_mappings', 0)
vim.cmd [[
	let g:VM_maps = {}
	let g:VM_maps["Select Cursor Down"] 		= '<C-Down>'
	let g:VM_maps["Select Cursor Up"]			= '<C-Up>'
	let g:VM_maps['Find Under'] 				= '<C-n>'
	let g:VM_maps['Find Subword Under'] 		= '<C-n>'
	let g:VM_maps["Find Next"]					= ']'
	let g:VM_maps["Find Prev"]					= '['
	let g:VM_maps["Goto Next"]					= '}'
	let g:VM_maps["Goto Prev"]					= '{'
	let g:VM_maps["Surround"]					= '<C-w>'
	let g:VM_maps["Replace Pattern"]			= '<C-r>'
	let g:VM_maps["Align"]						= '<C-a>'
]]
