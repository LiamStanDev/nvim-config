return function()
	require("ibl").setup({
		indent = { char = "▎" },
		scope = {
			enabled = false,
			show_exact_scope = true,
			highlight = { "IBLScope" },
		},
	})
end
