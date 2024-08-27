return {
    {
        "roobert/action-hints.nvim",

        config = function()
            require("action-hints").setup({
                template = {
                    definition = { text = " ⊛ : gd for definition", color = "#add8e6" },
                    references = { text = " ↱%s : gr for references", color = "#ff6666" },
                },
                use_virtual_text = true,
            })
        end,
    },

    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = {}, -- required, even if empty
        config = function()
            -- default settings
            require("lsp-endhints").setup {
                icons = {
                    type = "󰜁 ",
                    parameter = "󰏪 ",
                    offspec = " ", -- hint kind not defined in official LSP spec
                    unknown = " ", -- hint kind is nil
                },
                label = {
                    padding = 1,
                    marginLeft = 0,
                    bracketedParameters = true,
                },
                autoEnableHints = true,
            }
        end,
    }
}
