return function()
	local config = require("core.globals")

	require("lspsaga").setup({
		ui = {
			-- This option only works in Neovim 0.9
			title = true,
			-- Border type can be single, double, rounded, solid, shadow.
			border = "single",
			winblend = 0,
			expand = "",
			collapse = "",
			code_action = "💡",
			incoming = " ",
			outgoing = " ",
			hover = " ",
			kind = { ["Folder"] = { " ", "@comment" } },
		},
		finder = {
			max_height = 0.5,
			min_width = 30,
			force_max_height = false,
			keys = {
				toggle_or_open = "<CR>",
				vsplit = "v",
				split = "s",
				tabe = "t",
				tabnew = "r",
				quit = { "<C-c>", "q" },
				close_in_preview = "<ESC>",
			},
		},
		symbol_in_winbar = {
			enable = config.navigator_on,
			separator = " ",
			ignore_patterns = {},
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = true,
		},
		outline = {
			win_position = "right",
			win_with = "",
			win_width = 30,
			preview_width = 0.4,
			show_detail = true,
			auto_preview = true,
			auto_refresh = true,
			auto_close = true,
			custom_sort = nil,
			keys = {
				toggle_or_jump = "<CR>",
				quit = { "<ESC>", "q" },
			},
		},
		code_action = {
			num_shortcut = true,
			show_server_name = true,
			extend_gitsigns = true,
			keys = {
				-- string | table type
				quit = { "<ESC>", "q" },
				exec = "<CR>",
			},
		},
		rename = {
			quit = { "<ESC>", "<C-c>" },
			exec = "<CR>",
			select = "x",
			confirm = "<CR>",
			in_select = true,
			auto_save = true,
		},
		lightbulb = {
			enable = false,
			enable_in_insert = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
	})
end
