return function()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			untracked = { text = "┆" },
		},

		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			untracked = { text = "┆" },
		},
	})
end
