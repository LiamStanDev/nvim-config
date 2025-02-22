return function()
	require("mini.files").setup({
		mappings = {
			close = "q",
			go_in = "L",
			go_in_plus = "<CR>",
			go_out = "H",
			go_out_plus = "",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},
	})
end
