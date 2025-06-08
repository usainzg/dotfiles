return {
    {
        -- TELESCOPE

        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        {
            "nvim-telescope/telescope-frecency.nvim",
            -- install the latest stable version
            version = "*",
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            -- or                              , branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim',
                "nvim-telescope/telescope-live-grep-args.nvim",
            },

            config = function()
                require('telescope').load_extension('fzf')
                require('telescope').load_extension('live_grep_args')
                require("telescope").load_extension "frecency"
                local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
                local builtin = require('telescope.builtin')

                require('telescope').setup {
                    defaults = {
                        cache_picker = {
                            num_pickers = 20
                        }
                        -- Default configuration for telescope goes here:
                        -- config_key = value,
                        -- ..
                    }, }


                vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
                vim.keymap.set("n", "<leader>fg",
                    ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Find words" })
                vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
                vim.keymap.set('n', '/', builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })

                vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Telescope resume last search history" })
                vim.keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls,
                    { desc = "Telescope search incoming call " })
                vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions,
                    { desc = "Telescope type def" })
                vim.keymap.set('n', '<leader>fo', builtin.lsp_outgoing_calls,
                    { desc = "Telescope search incoming call " })
                vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "Telescope resume last search history" })
                vim.keymap.set('n', '<leader>fp', builtin.pickers, { desc = "Telescope search history" })
                vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Telescope search diagnostics" })

                vim.keymap.set("n", "<leader>g", live_grep_args_shortcuts.grep_word_under_cursor,
                    { desc = "Ripgrep under cursor" })
                vim.keymap.set("x", "<leader>g", live_grep_args_shortcuts.grep_visual_selection,
                    { desc = "Ripgrep selection" })


                -- SET UP KEYMAP FOR LSP, POTENTIALLY VIA TELESCOPE
                -- vim.keymap.set("n", "<leader>ldf", ":lua vim.lsp.buf.definition()<CR>")
                -- vim.keymap.set("n", "<leader>ldc", ":lua vim.lsp.buf.declaration()<CR>") -- Go to declaration
                -- vim.keymap.set("n" "<leader>i", ":lua vim.lsp.buf.incoming_calls()<CR>", {}) -- Show incoming calls to the function under the cursor
                -- vim.keymap.set("n", "<leader>o", ":lua vim.lsp.buf.outgoing_calls()<CR>", {}) -- Show outgoing calls from the function under the cursor
                -- vim.keymap.set("n", "<leader>td", builtin.lsp_type_definitions)   -- Go to type definition
                -- vim.keymap.set("n", "<leader>th", ":lua vim.lsp.buf.typehierachy()<CR>") -- Show type hierarchy
            end
        }
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
}
