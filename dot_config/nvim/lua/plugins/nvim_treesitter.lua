local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })

        require 'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "cpp" },
            sync_install = false,
            auto_install = true,

        }
    end,
}

return { M }
