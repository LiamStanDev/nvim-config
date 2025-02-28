return function()
	local luasnip = require("luasnip")
	luasnip.setup({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
	})

	-- let one file can use multiple snippet sources.
	luasnip.filetype_extend("typescriptreact", { "html" })
	luasnip.filetype_extend("javascriptreact", { "html" })

	require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/" } })

	local keymap = vim.keymap.set
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

	-- NOTE: key map setting are now in the nvim-cmp.lua
end
