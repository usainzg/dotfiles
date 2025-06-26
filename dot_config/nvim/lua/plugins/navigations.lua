return {
    {
        -- FZF-LUA

        {
            "ibhagwan/fzf-lua",

            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require('fzf-lua').setup({ 'telescope', "hide", })
                local fzf_lua = require("fzf-lua")

                vim.keymap.set('n', '<leader>ff', fzf_lua.files, { desc = "Find files" })
                vim.keymap.set("n", "<leader>fg",
                    fzf_lua.live_grep_native, { desc = "Find words" })
                vim.keymap.set('n', '<leader>fb', fzf_lua.oldfiles, { desc = "Find buffers" })
                vim.keymap.set('n', '<leader>fh', fzf_lua.help_tags, { desc = "Find help tags" })
                vim.keymap.set('n', '/', fzf_lua.lgrep_curbuf, { desc = "Find in current buffer" })

                vim.keymap.set('n', '<leader>fr', fzf_lua.resume, { desc = "fzf-lua resume last search history" })
                vim.keymap.set('n', '<leader>fi', fzf_lua.lsp_incoming_calls,
                    { desc = "fzf-lua search incoming call " })
                vim.keymap.set('n', '<leader>fo', fzf_lua.lsp_outgoing_calls,
                    { desc = "fzf-lua search incoming call " })
                vim.keymap.set('n', '<leader>fm', fzf_lua.man_pages, { desc = "fzf-lua resume last search history" })
                vim.keymap.set('n', '<leader>fp', fzf_lua.search_history, { desc = "fzf-lua search history" })
                vim.keymap.set('n', '<leader>fd', fzf_lua.lsp_finder, { desc = "LSP search diagnostics" })

                vim.keymap.set("n", "<leader>gw", fzf_lua.grep_cword,
                    { desc = "Ripgrep under cursor" })

                vim.keymap.set("n", "<leader>gr", fzf_lua.lsp_references,
                    { desc = "LSP references via fzf-lua" })
                vim.keymap.set("x", "<leader>g", fzf_lua.grep_visual,
                    { desc = "Ripgrep selection" })



                vim.keymap.set("n", "<leader>la", fzf_lua.lsp_code_actions,
                    { noremap = true, silent = true, desc = "Code action" })


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
