return function()
	require("oil").setup({
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-v>"] = { "actions.select", opts = { vertical = true } },
			["<C-s>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		view_options = {
			show_hidden = true,
			-- 	sort = {
			-- 		-- sort order can be "asc" or "desc"
			-- 		-- see :help oil-columns to see which columns are sortable
			-- 		{ "type", "asc" },
			-- 		{ "name", "asc" },
			-- 	},
		},

		float = {
			-- padding = 5,
			border = "rounded",
		},
	})
end
