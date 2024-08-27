return {
    {
        -- SHOWS TAB LINE
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = true,
    },

    {
        -- SHOWS STATUS LINE AT THE BOTTOM
        "nvim-lualine/lualine.nvim",

        config = function()
            require('lualine').setup {
                sections = {
                    lualine_x = { require("action-hints").statusline },
                },
                options = {
                    theme = "catppuccin",
                }
            }
        end


    },

    {
        -- SHOWS THE FILE'S HIARARCHY TREE
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    }
}
