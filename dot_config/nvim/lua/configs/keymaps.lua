function string:contains(sub)
	return self:find(sub, 1, true) ~= nil
end

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
keymap("v", "<BS>", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
keymap("v", "<Tab>", ">gv^", opts)

keymap("n", "<S-l>", ":tabnext<CR>", opts)
keymap("n", "<S-h>", ":tabprevious<CR>", opts)

-- keymap("n", "<leader>q", ":q<CR>", opts)
-- keymap("t", "<leader>q", ":bd<CR>", opts)

-- function handle_quit()
-- 	local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
-- 	print("Keymap triggered!")
-- 	if buftype == "terminal" then
-- 		vim.cmd("bw!")
-- 	else
-- 		vim.cmd("q")
-- 	end
-- end

-- vim.keymap.set('n', '<leader>q', function()
-- 	-- print("Keymap triggered!")
-- 	handle_quit()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>q", ":lua handle_quit()", opts)

keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>n", ":Navbuddy<CR>", opts)

local function get_matching_file(extensions, file_type)
	local filename = vim.api.nvim_buf_get_name(0)
	local old_filename = filename
	local basename = vim.fn.fnamemodify(filename, ":t:r") -- filename without extension

	-- Build regex pattern from extensions array
	local pattern = table.concat(extensions, "\\|")
	local handle = io.popen("find . -type f -regex '.*" .. basename .. "\\.\\(" .. pattern .. "\\)'")

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


keymap("n", "gs", ":%sm/", opts)
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
