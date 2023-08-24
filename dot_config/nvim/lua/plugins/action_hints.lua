return {
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
}
