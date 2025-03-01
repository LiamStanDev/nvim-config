-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Clear highlights
map("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- Split window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Disable arrow keys in normal mode
map("n", "<left>", '<CMD>echo "Use h to move!!"<CR>')
map("n", "<right>", '<CMD>echo "Use l to move!!"<CR>')
map("n", "<up>", '<CMD>echo "Use k to move!!"<CR>')
map("n", "<down>", '<CMD>echo "Use j to move!!"<CR>')

-- Move line/block
map({ "n", "i" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line/block down" })
map({ "n", "i" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line/block up" })
map("x", "<A-j>", ":m '>+1<CR>gv-gv", { desc = "Move line/block down" })
map("x", "<A-k>", ":m '<-2<CR>gv-gv", { desc = "Move line/block up" })

-- Head and tail of line
map("n", "<S-l>", "$", { desc = "Move to the end of the line" })
map("n", "<S-h>", "^", { desc = "Move to the start of the line" })

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Buffer Navigation
-- keymap("n", "<A-l>", ":bnext<CR>", { desc = "Next buffer" })
-- keymap("n", "<A-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Quick Indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Command mode completion selection
map("c", "<C-j>", "pumvisible() ? '<C-n>' : '<C-j>'", { expr = true })
map("c", "<C-k>", "pumvisible() ? '<C-p>' : '<C-k>'", { expr = true })

-- Save file
map("n", "<leader>w", "<CMD>silent! w!<CR>", { desc = "Save file" })
map("n", "<leader>W", "<CMD>silent! wa!<CR>", { desc = "Save all file" })

-- Quit
map("n", "<leader>q", "<CMD>confirm q<CR>", { desc = "Quit" })
map("n", "<leader>;", ":e $MYVIMRC<CR>", { desc = "Configuration" })

-- Split window
map("n", "<leader>bl", "<CMD>vsplit<CR>", { desc = "Split Right" })
map("n", "<leader>bj", "<CMD>split<CR>", { desc = "Split Down" })
