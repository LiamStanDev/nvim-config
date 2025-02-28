return function()
	require("CopilotChat").setup({
		window = {
			layout = "horizontal", -- 'vertical', 'horizontal', 'float', 'replace'
			width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
			height = 0.3, -- fractional height of parent, or absolute height in rows when > 1
		},

		sticky = {
			"#files:full",
		},

		-- for render markdown
		highlight_headers = false,
		separator = "---",
		error_header = "> [!ERROR] Error",
	})

	-- copilot chat
	local keymap = vim.keymap.set
	keymap({ "n", "i", "v", "t" }, "<A-]>", "<CMD>CopilotChatToggle<CR>")
end
