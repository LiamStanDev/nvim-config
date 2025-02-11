local keymap = vim.keymap.set
-- lsp
keymap("n", "ga", "<CMD>Lspsaga code_action<cr>")
keymap("n", "gD", "<CMD>Lspsaga peek_definition<CR>")
keymap("n", "gd", "<CMD>Lspsaga goto_definition<CR>") -- Use <C-t> to jump back
keymap("n", "gf", "<CMD>Lspsaga lsp_finder<CR>")
keymap("n", "gT", "<CMD>Lspsaga peek_type_definition<CR>")
keymap("n", "gt", "<CMD>Lspsaga goto_type_definition<CR>")
keymap("n", "gl", "<CMD>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "gb", "<CMD>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "gh", "<CMD>Lspsaga hover_doc<CR>")
keymap("n", "gk", "<CMD>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "gj", "<CMD>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "gr", "<CMD>Lspsaga rename ++project<CR>")
keymap("n", "go", "<CMD>Trouble symbols toggle<CR>")
keymap("n", "gi", function()
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
