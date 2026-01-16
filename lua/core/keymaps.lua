local M = {}
M.keymap = vim.keymap.set

-- Normal
function M.normalNR(keybind, action, desc)
	M.keymap("n", keybind, action, { silent = true, noremap = true, desc = desc })
end

function M.normalR(keybind, action, desc)
	M.keymap("n", keybind, action, { silent = true, desc = desc })
end

function M.normalNoOpt(keybind, action, desc)
	M.keymap("n", keybind, action, { desc = desc })
end

-- Visual
function M.visualNR(keybind, action, desc)
	M.keymap("v", keybind, action, { silent = true, noremap = true, desc = desc })
end

function M.visualR(keybind, action, desc)
	M.keymap("v", keybind, action, { silent = true, desc = desc })
end

function M.visualNoOpt(keybind, action, desc)
	M.keymap("v", keybind, action, { desc = desc })
end

-- Insert
function M.insertNR(keybind, action, desc)
	M.keymap("i", keybind, action, { silent = true, noremap = true, desc = desc })
end

function M.insertR(keybind, action, desc)
	M.keymap("i", keybind, action, { silent = true, desc = desc })
end

function M.insertNoOpt(keybind, action, desc)
	M.keymap("i", keybind, action, { desc = desc })
end

-- Terminal
function M.terminalNR(keybind, action, desc)
	M.keymap("t", keybind, action, { silent = true, noremap = true, desc = desc })
end

function M.terminalR(keybind, action, desc)
	M.keymap("t", keybind, action, { silent = true, desc = desc })
end

function M.terminalNoOpt(keybind, action, desc)
	M.keymap("t", keybind, action, { desc = desc })
end

-- General
M.normalNR("<leader>q", ":q<CR>", "Quit")
M.normalNR("<leader>Q", ":qa!<CR>", "Quit Neovim")

-- Buffers
M.normalNR("<leader>w", ":w<CR>", "Write Buffer")
M.normalNR("<leader>c", ":bdelete<CR>", "Close Buffer")
M.normalNR("<leader>bc", function()
	local bufs = vim.api.nvim_list_bufs()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, i in ipairs(bufs) do
		local name = vim.api.nvim_buf_get_name(i)
		if i ~= current_buf and not name:match("NvimTree_") then
			vim.api.nvim_buf_delete(i, {})
		end
	end
end, "Close all Buffer except current")

-- Interface
M.normalNR("<leader>h", ":noh<CR>", "Clear Highlights")

-- Width
M.normalNR("<C-Right>", "<C-w>3>", "Increase Width")
M.normalNR("<C-Left>", "<C-w>3<", "Decrease Width")

-- Height
M.normalNR("<C-Up>", "<C-w>3+", "Increase Height")
M.normalNR("<C-Down>", "<C-w>3-", "Decrease Height")

-- Motions
M.normalR("<C-d>", "<C-d>zz", "Scroll Down (Centered)")
M.normalR("<C-u>", "<C-u>zz", "Scroll Up (Centered)")

-- Navigate between windows with Shift + hjkl
M.normalNR("<S-h>", "<C-w>h", "Move Focus Left")
M.normalNR("<S-j>", "<C-w>j", "Move Focus Down")
M.normalNR("<S-k>", "<C-w>k", "Move Focus Up")
M.normalNR("<S-l>", "<C-w>l", "Move Focus Right")

-- Move the current window with Ctrl + Shift + hjkl
M.normalNR("<C-S-h>", "<C-w>H", "Move Window Left")
M.normalNR("<C-S-j>", "<C-w>J", "Move Window Down")
M.normalNR("<C-S-k>", "<C-w>K", "Move Window Up")
M.normalNR("<C-S-l>", "<C-w>L", "Move Window Right")

-- Indentation
M.normalNoOpt("+", ">", "Increment Indentation")
M.normalNoOpt("-", "<", "Decrement Indentation")
M.visualNoOpt("+", ">", "Increment Indentation")
M.visualNoOpt("-", "<", "Decrement Indentation")

M.normalNR("<leader>sv", ":vsplit<CR>", "Vertical Split")
M.normalNR("<leader>sh", ":split<CR>", "Horizontal Split")

-- Terminal
M.terminalNR("<C-q>", [[<C-\><C-n>]], "Quit Terminal Mode")
M.normalNR("<leader>tt", ":terminal<CR>", "Open in current Window") -- current window
M.normalNR("<leader>th", ":split | terminal<CR>", "Open Horizontal") -- horizontal split
M.normalNR("<leader>tv", ":vsplit | terminal<CR>", "Open Vertical") -- vertical split

return M
