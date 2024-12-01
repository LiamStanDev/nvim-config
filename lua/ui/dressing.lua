return function()
	require("dressing").setup({
		input = {
			enabled = true,
		},
		select = {
			enabled = true,
			backend = { "nui", "telescope", "fzf_lua", "fzf", "builtin" },
		},
	})
end
