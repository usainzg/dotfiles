local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)

keymap("n", "<leader>q", ":q<CR>", opts)

-- SET UP KEYMAP FOR CODE ACTION
keymap("n", "<S-j>", ":lua vim.lsp.buf.code_action()<CR>")
local open_or_move_to_tab = function()
    local term = "terminal"
    if vim.fn.bufexists(term) == 1 then
        vim.cmd("drop " .. term)
    else
        vim.cmd("tabnew | terminal")
        vim.cmd("file terminal")
    end
end

keymap("n", "<leader>t", open_or_move_to_tab, opts)
vim.cmd("tnoremap <esc> <C-\\><C-N>")



vim.keymap.set('n', '<Leader>5', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>6', function() require('dap').terminate() end)
vim.keymap.set('n', '<Leader>7', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>8', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>9', function() require('dap').step_out() end)

vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
