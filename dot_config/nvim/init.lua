vim.g.mapleader = " "

vim.cmd("filetype plugin on")

require("configs")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    { import = 'plugins' }
}, {
    dev = {
        path = '~/Developer/nvim_proj',
    },
})

require 'lspconfig'.ocamllsp.setup {}
vim.opt.cursorline = true
