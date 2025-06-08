local utils = require("utils")
function string:contains(sub)
    return self:find(sub, 1, true) ~= nil
end

local opts = { noremap = true, silent = true }


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

keymap("v", "<", "<gv^", { noremap = true, silent = true, desc = "Persistent backwards tab #1" })
keymap("v", "<BS>", "<gv^", { noremap = true, silent = true, desc = "Persistent backwards tab #2" })
keymap("v", ">", ">gv^", { noremap = true, silent = true, desc = "Persistent forwards tab #1" })
keymap("v", "<Tab>", ">gv^", { noremap = true, silent = true, desc = "Persistent forwards tab #2" })

keymap("n", "<S-l>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Go to tab on the right" })
keymap("n", "<S-h>", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Go to tab on the left" })

keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>n", ":Navbuddy<CR>", opts)



vim.keymap.set("x", "<leader>lr", function()
    local selected = utils.extract_vis_text()
    vim.print("Selected text : " .. selected)

    local selected_escaped = utils.jasmine_escape(selected)
    vim.print("escaped text : " .. selected_escaped)

    local change = vim.fn.input({ prompt = "Mass change: ", default = selected })

    vim.print("change: " .. change)

    local change_escape = utils.jasmine_escape(change)
    vim.cmd("!fd  --type f . | xargs sed -i 's/" .. selected_escaped .. "/" .. change_escape .. "/g'")
end, { desc = "Mass rename of string" })

vim.keymap.set("n", "cp", function()
    local next = vim.fn.search("(")
    if next ~= 0 then
        vim.api.nvim_feedkeys("lcw", "n", true)
    end
end)
vim.keymap.set("n", "gs", ":%sm/", { noremap = true, silent = true, desc = "Highlight words under cursor" })
-- QUICKLY EXIT TERMINAL MODE
vim.cmd("tnoremap <esc> <C-\\><C-N>")



-- THIS IS FOR DEBUGGING
-- vim.keymap.set('n', '<Leader>5', function() require('dap').continue() end)
-- vim.keymap.set('n', '<Leader>6', function() require('dap').terminate() end)
-- vim.keymap.set('n', '<Leader>7', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<Leader>8', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<Leader>9', function() require('dap').step_out() end)
--
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp',
--     function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
--     require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
--     require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.scopes)
-- end)
