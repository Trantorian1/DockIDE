-- dependencies
local plugins = require "core.plugins"

if not plugins.ui.telescope["loaded"] then
    return
end

local dropdown_theme = require('telescope.themes').get_dropdown({
    results_height = 20;
    winblend = 20;
    width = 0.8;
    prompt_title = '';
    prompt_prefix = 'Files>';
    previewer = false;
    borderchars = {
        prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
        preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
    };
})

plugins.ui.telescope.setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        },
		prompt_prefix = "   ",
    },
    pickers = {
        git_files = {
            theme = "dropdown",
        }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    },
    extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    }
}