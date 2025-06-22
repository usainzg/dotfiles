return {
    {
        'crispgm/nvim-tabline',
        dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
        config = function()
            require('tabline').setup({
                show_index = true,           -- show tab index
                show_modify = true,          -- show buffer modification indicator
                show_icon = true,            -- show file extension icon
                fnamemodify = ':t',          -- file name modifier string
                -- can be a function to modify buffer name
                modify_indicator = '[+]',    -- modify indicator
                no_name = 'No name',         -- no name buffer name
                brackets = { '', '' },       -- file name brackets surrounding
                inactive_tab_max_length = 0, -- max length of inactive tab titles, 0 to ignore

            })
        end
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
                },
            }
        end


    },

    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
        config = function()
            -- local dropbar_api = require('dropbar.api')
            -- vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
            -- vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
            -- vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
        end
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             -- transparent_background = true, -- disables setting the background color.
    --             custom_highlights = function(colors)
    --                 return {
    --                     TabLineSel = { bg = colors.sky },
    --                     CmpBorder = { fg = colors.surface2 },
    --                 }
    --             end
    --
    --         })
    --         --- latte for light
    --         --- mocha for dark
    --         vim.cmd.colorscheme "catppuccin-latte"
    --     end
    -- },
    {
        "Shatur/neovim-ayu",
        priority = 1000,
        config = function()
            require('ayu').setup({
                mirage = false,  -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
                terminal = true, -- Set to `false` to let terminal manage its own colors.
                overrides = {
                    TabLineSel = { fg = "#2E82FF", bg = "None" },
                },
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
