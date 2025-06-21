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
        require("oil").setup({
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            keymaps = {
                ["-"] = { "actions.parent", mode = "n" },
                ["h"] = { "actions.parent", mode = "n" },
                ["<CR>"] = { "actions.select", opts = { tab = true } },
                ["l"] = "actions.select",
            },
        })
    end
}
