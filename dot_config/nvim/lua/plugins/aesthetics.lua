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
                options = {
                    theme = 'ayu',
                },
                sections = {

                    lualine_a = {
                        'mode', 'branch' },
                    lualine_b = { 'lsp_status'
                    }
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
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- require("catppuccin").setup({
            --     transparent_background = true, -- disables setting the background color.
            --
            -- })
            -- --- latte for light
            -- --- mocha for dark
            -- vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        "Shatur/neovim-ayu",
        priority = 1000,
        config = function()
            require('ayu').setup({
                mirage = false,  -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
                terminal = true, -- Set to `false` to let terminal manage its own colors.
                overrides = {},  -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
            })
            require('ayu').colorscheme()
        end
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
    }
}
