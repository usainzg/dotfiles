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
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", {}) -- Go to implementation

local function get_matching_file(extensions, file_type)
	local filename = vim.api.nvim_buf_get_name(0)
	local old_filename = filename
	local basename = vim.fn.fnamemodify(filename, ":t:r") -- filename without extension

	-- Build regex pattern from extensions array
	local pattern = table.concat(extensions, "|")
	local cmd = "fd --type f --regex '" .. basename .. "\\.(" .. pattern .. ")' ."
	vim.print(cmd)
	local handle = io.popen(cmd)

	if not handle then
		print("Failed to run search command for " .. file_type .. ".")
		return
	end

	local result = handle:read("*a")
	handle:close()

	local files = {}
	for line in result:gmatch("[^\r\n]+") do
		if line:match("%." .. basename .. "%.") == nil then
			table.insert(files, line)
		end
	end

	if #files == 0 then
		print("No corresponding " .. file_type .. " file found for " .. basename)
		return
	end

	return { old_filename, files[1] }
end


vim.keymap.set("n", "<leader>c", function()
	local curr_and_match = get_matching_file({ "cpp", "cc", "cxx" }, ".cpp/.cc/.cxx")
	if curr_and_match == nil then return end
	vim.cmd("e " .. curr_and_match[2])
	vim.cmd("vsplit " .. curr_and_match[1])
end, { desc = "Open matching .cpp file in vertical split" })

vim.keymap.set("n", "<leader>h", function()
	local curr_and_match = get_matching_file({ "h", "hpp", "hxx" }, ".h/.hpp/.hxx")

	if curr_and_match == nil then return end
	vim.cmd("e " .. curr_and_match[1])
	vim.cmd("vsplit " .. curr_and_match[2])
end, { desc = "Open matching .header file in vertical split" })

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
