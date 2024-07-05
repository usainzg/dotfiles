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

-- SET UP KEYMAP FOR LSP
keymap("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>")      -- Show code actions
keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>")           -- Rename symbols with scope-correctness
keymap("n", "<leader>ldf", ":lua vim.lsp.buf.definition()<CR>")      -- Go to definition
keymap("n", "<leader>ldc", ":lua vim.lsp.buf.declaration()<CR>")     -- Go to declaration

keymap("n", "<leader>lim", ":lua vim.lsp.buf.implementation()<CR>")  -- Go to implementation
keymap("n", "<leader>lic", ":lua vim.lsp.buf.incoming_calls()<CR>")  -- Show incoming calls to the function under the cursor
keymap("n", "<leader>loc", ":lua vim.lsp.buf.outgoing_calls()<CR>")  -- Show outgoing calls from the function under the cursor
keymap("n", "<leader>ltd", ":lua vim.lsp.buf.type_definition()<CR>") -- Go to type definition
keymap("n", "<leader>lth", ":lua vim.lsp.buf.typehierachy()<CR>")    -- Show type hierarchy

-- QUICKLY EXIT TERMINAL MODE
vim.cmd("tnoremap <esc> <C-\\><C-N>")


keymap("n", "<leader>t1", "1gt", opts) -- Switch to tab 1
keymap("n", "<leader>t2", "2gt", opts) -- Switch to tab 2
keymap("n", "<leader>t3", "3gt", opts) -- Switch to tab 3
keymap("n", "<leader>t4", "4gt", opts)
keymap("n", "<leader>t5", "5gt", opts)
keymap("n", "<leader>t6", "6gt", opts)
keymap("n", "<leader>t7", "7gt", opts)
keymap("n", "<leader>t8", "8gt", opts)
keymap("n", "<leader>t9", "9gt", opts)
keymap("n", "<leader>t0", "0gt", opts)
-- THIS IS FOR DEBUGGING
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
