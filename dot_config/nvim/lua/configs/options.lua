vim.opt.hlsearch = true
vim.opt.mouse = "a"

vim.api.nvim_set_option("clipboard", "unnamed")


vim.opt.relativenumber = true
vim.opt.number         = true

vim.opt.scrolloff      = 10

vim.opt.tabstop        = 8
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.incsearch      = true

vim.opt.numberwidth    = 4
vim.opt.signcolumn     = "yes:3"

vim.opt.laststatus     = 3

vim.opt.spell          = true

vim.opt.termguicolors  = true
vim.opt.syntax         = "on"

vim.diagnostic.config({
    virtual_text = true,
})

-- Enable autoread
vim.o.autoread = true

-- Check if file has changed on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end
})

-- Notification after file change
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.api.nvim_echo({ {
            "File changed on disk. Buffer reloaded.",
            "WarningMsg"
        } }, true, {})
    end
})
