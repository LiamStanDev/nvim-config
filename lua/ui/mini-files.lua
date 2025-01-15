return function()
	require("mini.files").setup({
		mappings = {
			close = "q",
			go_in = "l",
			go_in_plus = "<CR>",
			go_out = "h",
			go_out_plus = "<ESC>",
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
