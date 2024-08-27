return {
    {
        -- TELESCOPE

        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
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
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                vim.keymap.set("n", "<leader>fg",
                    ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
                vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
                vim.keymap.set('n', '/', builtin.current_buffer_fuzzy_find, {})



                -- SET UP KEYMAP FOR LSP, POTENTIALLY VIA TELESCOPE
                vim.keymap.set("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>")          -- Show code actions
                vim.keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>")               -- Rename symbols with scope-correctness
                vim.keymap.set("n", "<leader>ldf", ":lua vim.lsp.buf.definition()<CR>", {})      -- Go to definition
                vim.keymap.set("n", "<leader>ldc", ":lua vim.lsp.buf.declaration()<CR>")         -- Go to declaration

                vim.keymap.set("n", "<leader>lim", ":lua vim.lsp.buf.implementation()<CR>", {})  -- Go to implementation
                vim.keymap.set("n", "<leader>lic", ":lua vim.lsp.buf.incoming_calls()<CR>", {})  -- Show incoming calls to the function under the cursor
                vim.keymap.set("n", "<leader>loc", ":lua vim.lsp.buf.outgoing_calls()<CR>", {})  -- Show outgoing calls from the function under the cursor
                vim.keymap.set("n", "<leader>ltd", ":lua vim.lsp.buf.type_definition()<CR>", {}) -- Go to type definition
                vim.keymap.set("n", "<leader>lth", ":lua vim.lsp.buf.typehierachy()<CR>")        -- Show type hierarchy
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
