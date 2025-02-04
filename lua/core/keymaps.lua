-- leader key
vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
local opts_general = { noremap = true, silent = true }

local insert_mode = {
	-- ["kj"] = "<Esc>",
	-- Move current line / block with Alt-j/k ala vscode.
	["<A-j>"] = "<Esc>:m .+1<CR>==gi",
	["<A-k>"] = "<Esc>:m .-2<CR>==gi",

	-- ["<C-j>"] = "<C-o>j",
	-- ["<C-h>"] = "<C-o>h",
	-- ["<C-k>"] = "<C-o>k",
	-- ["<C-l>"] = "<C-o>l",
}

local normal_mode = {
	-- Quick Curser
	["<S-l>"] = "$",
	["<S-h>"] = "^",

	["<C-h>"] = "<C-w>h",
	["<C-j>"] = "<C-w>j",
	["<C-k>"] = "<C-w>k",
	["<C-l>"] = "<C-w>l",

	-- Resize with arrows
	["<C-Up>"] = ":resize -2<CR>",
	["<C-Down>"] = ":resize +2<CR>",
	["<C-Left>"] = ":vertical resize -2<CR>",
	["<C-Right>"] = ":vertical resize +2<CR>",

	-- Move current line / block with Alt-j/k a la vscode.
	["<A-j>"] = ":m .+1<CR>==",
	["<A-k>"] = ":m .-2<CR>==",

	-- Buffer Navigate
	["<A-l>"] = ":bnext<CR>",
	["<A-h>"] = ":bprevious<CR>",

	-- black hole
	["x"] = '"_x',
}

local visual_mode = {
	-- Better indenting
	["<"] = "<gv",
	[">"] = ">gv",
	["x"] = '"_x',
	-- ["<S-l>"] = "$",
	-- ["<S-h>"] = "^",
	-- ["p"] = '"0p',
	-- ["P"] = '"0P',
}

local visual_block_mode = {
	-- Move current line / block with Alt-j/k ala vscode.
	["<A-j>"] = ":m '>+1<CR>gv-gv",
	["<A-k>"] = ":m '<-2<CR>gv-gv",
	-- ["<S-l>"] = "$",
	-- ["<S-h>"] = "^",
}

local command_mode = {
	-- navigate tab completion with <c-j> and <c-k>
	["<C-j>"] = 'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
	["<C-k>"] = 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"',
}

for key, val in pairs(insert_mode) do
	keymap("i", key, val, opts_general)
end

for key, val in pairs(normal_mode) do
	keymap("n", key, val, opts_general)
end

for key, val in pairs(visual_mode) do
	keymap("v", key, val, opts_general)
end

for key, val in pairs(command_mode) do
	keymap("c", key, val, { expr = true, noremap = true })
end

for key, val in pairs(visual_block_mode) do
	keymap("x", key, val, opts_general)
end
