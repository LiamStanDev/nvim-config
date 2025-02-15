local keymap = vim.keymap.set

keymap("n", "gI", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
-- ufo
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- NOTE: not using C-], C-\, and etc for mapping keys because some terminal legacy problem
-- copilot chat
keymap({ "n", "i", "v", "t" }, "<A-]>", "<CMD>CopilotChatToggle<CR>")

-- toggle term
keymap({ "n", "i", "v", "t" }, "<A-`>", "<CMD>ToggleTerm<CR>")

-- task runner
keymap({ "n", "i", "v", "t" }, "<A-\\>", "<CMD>ShowTasks<CR>")

-- dbui
keymap({ "n", "i", "v" }, "<A-/>", "<CMD>DBUIToggle<CR>")

-- clangd
keymap({ "n", "i", "v" }, "<A-s>", "<CMD>ClangdSwitchSourceHeader<CR>")

-- luasnip
keymap({ "n", "i", "v", "s" }, "<A-.>", function()
	if require("luasnip").jumpable(1) then
		require("luasnip").jump(1)
	end
end)
keymap({ "n", "i", "v", "s" }, "<A-,>", function()
	if require("luasnip").jumpable(-1) then
		require("luasnip").jump(-1)
	end
end)
