return function()
	-- for github copilot
	-- vim.keymap.set("i", "<C-A>", 'copilot#Accept("\\<CR>")', {
	-- 	expr = true,
	-- 	replace_keycodes = false,
	-- })
	--
	-- vim.g.copilot_no_tab_map = true

	-- for copilot lua version
	require("copilot").setup({
		panel = {
			enabled = false,
		},
		suggestion = {
			enabled = false,
		},
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
			["."] = false,
		},
		copilot_node_command = "node", -- Node.js version must be > 18.x
		server_opts_overrides = {},
	})

	require("copilot_cmp").setup()

	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
end
