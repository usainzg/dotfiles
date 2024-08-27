local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.install").update({ with_sync = true })

        require 'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp",
                "elixir", "heex", "eex", "erlang" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },

        }
    end,

}


return { M }
