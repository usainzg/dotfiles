vim.opt.hlsearch = true
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"


vim.opt.relativenumber = true
vim.opt.number         = true

vim.opt.scrolloff      = 10

vim.opt.tabstop        = 8
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
-- vim.opt.expandtab      = true
vim.opt.incsearch      = true

vim.opt.numberwidth    = 2
vim.opt.signcolumn     = "yes:2"

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


--- Open file at the last position it was edited earlier
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end,
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern  = '*',
    callback = function() vim.highlight.on_yank { timeout = 300 } end
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
    desc = "Remove hl search when enter Insert",
    callback = vim.schedule_wrap(function()
        vim.cmd.nohlsearch()
    end),
})
