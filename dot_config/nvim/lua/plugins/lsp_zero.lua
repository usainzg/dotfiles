return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {                            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },


    config = function()
        require("mason").setup({})
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            lsp.buffer_autoformat()
        end)
        -- Fix Undefined global 'vim'
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",

                -- Run pip install python-language-server
                -- Then in neovim, runs :PylspInstall pyls-flake8 pylsp-mypy pyls-isort

                "pylsp",

                -- C, C++, CMAKE
                "clangd",
                "cmake",


                -- BASH SCRIPT
                "bashls",

                -- OCAML
                "ocamllsp",

                -- Elixir
                "elixirls",
            },
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        }

        lsp.setup()

        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = {
                { name = "path" },
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "buffer",                 keyword_length = 3 },
                { name = "luasnip",                keyword_length = 2 },
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
            }
        })
    end
}
