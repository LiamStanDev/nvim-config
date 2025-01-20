return function()
	local keymap = vim.keymap.set
	keymap("n", "<C-\\>", "<CMD>CopilotChatToggle<CR>")
	keymap("i", "<C-\\>", "<CMD>CopilotChatToggle<CR>")
	require("CopilotChat").setup({
		model = "gpt-4o", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
		agent = "copilot", -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
		context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).

		window = {
			layout = "horizontal", -- 'vertical', 'horizontal', 'float', 'replace'
			width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
			height = 0.3, -- fractional height of parent, or absolute height in rows when > 1
			-- Options below only apply to floating windows
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
		},

		-- for render markdown
		highlight_headers = false,
		separator = "---",
		error_header = "> [!ERROR] Error",
	})
end
