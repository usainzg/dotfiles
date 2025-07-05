return {
    {
        -- FZF-LUA

        {
            "ibhagwan/fzf-lua",

            dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter-context" },
            config = function()
                require 'treesitter-context'.setup {
                    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                    -- multiwindow = false,      -- Enable multiwindow support.
                    -- max_lines = 2,            -- How many lines the window should span. Values <= 0 mean no limit.
                    -- min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                    -- line_numbers = true,
                    -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
                    -- trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                    -- mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                    -- -- Separator between context and content. Should be a single character string, like '-'.
                    -- -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                    -- separator = nil,
                    -- zindex = 20,     -- The Z-index of the context window
                    -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
                }
                require('fzf-lua').setup({
                    'telescope',
                    "hide",
                    winopts = {
                        -- split = "belowright new",-- open in a split instead?
                        -- "belowright new"  : split below
                        -- "aboveleft new"   : split above
                        -- "belowright vnew" : split right
                        -- "aboveleft vnew   : split left
                        -- Only valid when using a float window
                        -- (i.e. when 'split' is not defined, default)
                        height     = 0.93, -- window height
                        width      = 0.90, -- window width
                        row        = 0.35, -- window row position (0=top, 1=bottom)
                        col        = 0.50, -- window col position (0=left, 1=right)
                        -- border argument passthrough to nvim_open_win()
                        border     = "rounded",
                        -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
                        backdrop   = 60,
                        -- title         = "Title",
                        -- title_pos     = "center",        -- 'left', 'center' or 'right'
                        -- title_flags   = false,           -- uncomment to disable title flags
                        fullscreen = false, -- start fullscreen?
                        -- enable treesitter highlighting for the main fzf window will only have
                        -- effect where grep like results are present, i.e. "file:line:col:text"
                        -- due to highlight color collisions will also override `fzf_colors`
                        -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
                        treesitter = {
                            enabled    = true,
                            fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
                        },
                        preview    = {
                            -- default     = 'bat',           -- override the default previewer?
                            -- default uses the 'builtin' previewer
                            border       = "rounded", -- preview border: accepts both `nvim_open_win`
                            -- and fzf values (e.g. "border-top", "none")
                            -- native fzf previewers (bat/cat/git/etc)
                            -- can also be set to `fun(winopts, metadata)`
                            wrap         = true,        -- preview line wrap (fzf's 'wrap|nowrap')
                            hidden       = false,       -- start preview hidden
                            vertical     = "down:45%",  -- up|down:size
                            horizontal   = "right:60%", -- right|left:size
                            layout       = "flex",      -- horizontal|vertical|flex
                            flip_columns = 100,         -- #cols to switch to horizontal on flex
                            -- Only used with the builtin previewer:
                            title        = true,        -- preview border title (file/buf)?
                            title_pos    = "center",    -- left|center|right, title alignment
                            scrollbar    = "float",     -- `false` or string:'float|border'
                            -- float:  in-window floating border
                            -- border: in-border "block" marker
                            scrolloff    = -1, -- float scrollbar offset from right
                            -- applies only when scrollbar = 'float'
                            delay        = 20, -- delay(ms) displaying the preview
                            -- prevents lag on fast scrolling
                            winopts      = {   -- builtin previewer window options
                                number         = true,
                                relativenumber = false,
                                cursorline     = true,
                                cursorlineopt  = "both",
                                cursorcolumn   = false,
                                signcolumn     = "no",
                                list           = false,
                                foldenable     = false,
                                foldmethod     = "manual",
                            },
                        },
                        on_create  = function()
                            -- called once upon creation of the fzf main window
                            -- can be used to add custom fzf-lua mappings, e.g:
                            --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
                        end,
                        -- called once _after_ the fzf interface is closed
                        -- on_close = function() ... end
                    },
                    oldfiles = {
                        prompt                  = 'History❯ ',
                        cwd_only                = true,
                        stat_file               = true, -- verify files exist on disk
                        -- can also be a lua function, for example:
                        -- stat_file = require("fzf-lua").utils.file_is_readable,
                        -- stat_file = function() return true end,
                        include_current_session = true, -- include bufs from current session
                    },
                    --
                    previewers = {
                        builtin = {
                            syntax          = true,             -- preview syntax highlight?
                            syntax_limit_l  = 0,                -- syntax limit (lines), 0=nolimit
                            syntax_limit_b  = 1024 * 1024,      -- syntax limit (bytes), 0=nolimit
                            limit_b         = 1024 * 1024 * 10, -- preview limit (bytes), 0=nolimit
                            -- previewer treesitter options:
                            -- enable specific filetypes with: `{ enabled = { "lua" } }
                            -- exclude specific filetypes with: `{ disabled = { "lua" } }
                            -- disable `nvim-treesitter-context` with `context = false`
                            -- disable fully with: `treesitter = false` or `{ enabled = false }`
                            treesitter      = {
                                enabled = true,
                                disabled = {},
                                -- nvim-treesitter-context config options
                                context = { enable = true, max_lines = 2, line_number = true, trim_scope = "outer" }
                            },
                            -- By default, the main window dimensions are calculated as if the
                            -- preview is visible, when hidden the main window will extend to
                            -- full size. Set the below to "extend" to prevent the main window
                            -- from being modified when toggling the preview.
                            toggle_behavior = "default",
                            -- Title transform function, by default only displays the tail
                            -- title_fnamemodify = function(s) return vim.fn.fnamemodify(s, ":t") end,
                            -- preview extensions using a custom shell command:
                            -- for example, use `viu` for image previews
                            -- will do nothing if `viu` isn't executable
                            extensions      = {
                                -- neovim terminal only supports `viu` block output
                                ["png"] = { "viu", "-b" },
                                -- by default the filename is added as last argument
                                -- if required, use `{file}` for argument positioning
                                ["svg"] = { "chafa", "{file}" },
                                ["jpg"] = { "ueberzug" },
                            },
                            -- if using `ueberzug` in the above extensions map
                            -- set the default image scaler, possible scalers:
                            --   false (none), "crop", "distort", "fit_contain",
                            --   "contain", "forced_cover", "cover"
                            -- https://github.com/seebye/ueberzug
                            ueberzug_scaler = "cover",
                            -- render_markdown.nvim integration, enabled by default for markdown
                            render_markdown = { enabled = true, filetypes = { ["markdown"] = true } },
                            -- snacks.images integration, enabled by default
                            snacks_image    = { enabled = true, render_inline = true },
                        },
                        -- Code Action previewers, default is "codeaction" (set via `lsp.code_actions.previewer`)
                        -- "codeaction_native" uses fzf's native previewer, recommended when combined with git-delta
                        codeaction = {
                            -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
                            diff_opts = { ctxlen = 3 },
                        },
                        codeaction_native = {
                            diff_opts = { ctxlen = 3 },
                            -- git-delta is automatically detected as pager, set `pager=false`
                            -- to disable, can also be set under 'lsp.code_actions.preview_pager'
                            -- recommended styling for delta
                            --pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
                        },
                    }
                })
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



                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,
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
