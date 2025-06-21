---@type LazySpec
return
{
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.

    lazy = false,
    config = function()
        local oil = require("oil")
        local actions = require("oil.actions")
        local function smart_select()
            local entry = oil.get_cursor_entry()
            if entry and entry.type == "directory" then
                actions.select.callback()
            else
                actions.select.callback({ tab = true })
            end
        end
        require("oil").setup({
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },

            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["-"] = { "actions.parent", mode = "n" },
                ["h"] = { "actions.parent", mode = "n" },
                ["<CR>"] = { callback = smart_select },
                ["l"] = { callback = smart_select },
            },
        })
    end
}
