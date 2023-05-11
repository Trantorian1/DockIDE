-- dependencies
local plugins = require "core.plugins"

-- makes sure nvim cmp is correctly loaded
if not plugins.lsp.cmp.core["loaded"] then
    return
end

-- makes sure luasnip is correctly loaded
if not plugins.lsp.luasnip.core["loaded"] then
	return
end

-- makes sure lspkind is correctly loaded
if not plugins.lsp.lspkind["loaded"] then
	return
end

-- sets up luasnip
plugins.lsp.luasnip.loaders.vs_code.lazy_load()

-- sets up nvim cmp
plugins.lsp.cmp.core.setup {
    -- navigation mappings
    mapping = plugins.lsp.cmp.core.mapping.preset.insert {
        ['<E>'] = plugins.lsp.cmp.core.mapping.abort(),
        ['<Enter>'] = plugins.lsp.cmp.core.mapping.confirm({ select = true }),

        -- super tab mappings
        ["<Down>"] = plugins.lsp.cmp.core.mapping(function(fallback)
            if plugins.lsp.cmp.core.visible() then
                plugins.lsp.cmp.core.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = plugins.lsp.cmp.core.mapping(function(fallback)
            if plugins.lsp.cmp.core.visible() then
                plugins.lsp.cmp.core.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    },

	-- completion window appearence
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},

	-- suggestion format
	formatting = {

		-- completion type | completion | completion source
		fields = { "kind", "abbr", "menu" },

		-- sets completion format
		format = function(entry, vim_item)
			local kind = plugins.lsp.lspkind.cmp_format(
				{ mode = "symbol_text", maxwidth = 50 }
			)(entry, vim_item)

			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
	  
			return kind
		  end,
	},

    -- order of sources, with lower indices having higher priority
	sources = {
		{ name = 'buffer' },
		{ name = 'path' }
    },

    -- experimental features
	experimental = {
		ghost_text = true	-- enables completion preview
	}
}
