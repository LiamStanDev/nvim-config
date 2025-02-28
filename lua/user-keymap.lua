local keymap = vim.keymap.set

-- NOTE: not using C-], C-\, and etc for mapping keys because some terminal legacy problem

-- toggle term
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
