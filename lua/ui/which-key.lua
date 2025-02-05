return function()
	local which_key = require("which-key")
	local config = require("core.globals")

	local mappings = {
		{ "<leader>w", "<CMD>silent! w!<CR>", desc = "Save" },
		{ "<leader>W", "<CMD>silent! wa!<CR>", desc = "Save all" },
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "Format File",
		},
		{ "<leader>q", "<CMD>confirm q<CR>", desc = "Quit" },
		{ "<leader>c", "<CMD>Bdelete!<CR>", desc = "Close Buffer" },
		{
			"<leader>p",
			function()
				require("telescope.builtin").find_files(
					require("telescope.themes").get_dropdown({ previewer = false, hidden = true })
				)
			end,
			desc = "Find File",
		},
		{
			"<leader>h",
			"<CMD>nohlsearch<CR>",
			desc = "No Highlight",
		},
		-- { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "Explorer" },
		{
			"<leader>e",
			function()
				require("oil").toggle_float()
			end,
			desc = "Explorer",
		},
		{ "<leader>;", ":e $MYVIMRC<CR>", desc = "Configuration" },
		{
			"<leader>/",
			"<CMD>DBUIToggle<CR>",
			desc = "Toggle database client",
		},
		{
			"<leader>\\",
			"<CMD>ShowTasks<CR>",
			desc = "Task Runner",
		},

		-- markdown
		{ "<leader>m", group = "Markdown" },
		{ "<leader>mm", "<CMD>RenderMarkdown toggle<CR>", desc = "Markdown Render Toggle" },
		{ "<leader>mp", "<CMD>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },

		-- buffer
		{ "<leader>b", group = "Buffer" },
		{ "<leader>bl", "<CMD>vsplit<CR>", desc = "Split Right" },
		{ "<leader>bj", "<CMD>split<CR>", desc = "Split Down" },

		--debug
		{ "<leader>d", group = "Debug" },
		{ "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
		{ "<leader>dl", "<CMD>:Telescope dap list_breakpoints<CR>", desc = "List Breakpoints" },
		{ "<leader>dc", "<CMD>lua require'dap'.continue()<CR>", desc = "Continue" },
		{ "<leader>dq", "<CMD>lua require'dap'.disconnect()<CR>", desc = "Disconnect" },
		{ "<leader>ds", "<CMD>lua require'dap'.step_into()<CR>", desc = "Step Into" },
		{ "<leader>dn", "<CMD>lua require'dap'.step_over()<CR>", desc = "Step Over" },
		{ "<leader>do", "<CMD>lua require'dap'.step_out()<CR>", desc = "Step Out" },
		{
			"<leader>dr",
			function()
				vim.api.nvim_command("lua require'dap'.continue()")
			end,
			desc = "Start",
		},
		{ "<leader>du", "<CMD>lua require'dapui'.toggle({reset = true})<CR>", desc = "Toggle UI" },

		-- git
		{
			mode = { "n", "v" },
			{ "<leader>g", group = "Git" },
			{
				"<leader>gg",
				function()
					require("neogit").open()
				end,
				desc = "Open Git (fugitive)",
			},
			{ "<leader>gG", "<CMD>Lazygit<CR>", desc = "Open Lazygit" },
			{ "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", desc = "Open Lazygit" },
			{ "<leader>gl", "<CMD>lua require 'gitsigns'.blame_line()<CR>", desc = "Blame" },
			-- { "<leader>gd", "<CMD>Gvdiffsplit<CR>", desc = "Git Show Diff (fugitive)" },
			{
				"<leader>gj",
				"<CMD>lua require 'gitsigns'.next_hunk({navigation_message = true})<CR>",
				desc = "Next Hunk",
			},
			{
				"<leader>gk",
				"<CMD>lua require 'gitsigns'.prev_hunk({navigation_message = true})<CR>",
				desc = "Prev Hunk",
			},
			-- { "<leader>gL", "<CMD>diffget LOCAL<CR>", desc = "Choose Local (mergetool)" },
			-- { "<leader>gB", "<CMD>diffget BASE<CR>", desc = "Choose Base (mergetool)" },
			-- { "<leader>gR", "<CMD>diffget REMOTE<CR>", desc = "Choose Remote (mergetool)" },
			-- { "<leader>gr", "<CMD>lua require 'gitsigns'.reset_hunk()<CR>", desc = "Reset Hunk (gitsing)" },
			-- { "<leader>gw", "<CMD>lua require 'gitsigns'.stage_hunk()<CR>", desc = "Stage Hunk (gitsign)" },
			-- { "<leader>gR", "<CMD>Gread<CR>", desc = "Git Reset (fugitive)" },
			-- { "<leader>gW", "<CMD>Gwrite<CR>", desc = "Git Add (fugitive)" },
		},

		-- lsp
		{ "<leader>l", group = "LSP" },
		{ "<leader>lR", "<CMD>LspRestart<CR>", desc = "Lsp Restart" },

		-- search
		{ "<leader>s", group = "Search" },
		{ "<leader>sf", "<CMD>Telescope find_files<CR>", desc = "Find File" },
		{ "<leader>st", "<CMD>Telescope live_grep<CR>", desc = "Text" },
		{ "<leader>sn", "<CMD>Telescope notify<CR>", desc = "Notify History" },
		{ "<leader>sc", "<CMD>Telescope colorscheme<CR>", desc = "Colorscheme" },
		{ "<leader>sr", "<CMD>Telescope oldfiles<CR>", desc = "Open Recent File" },
		{ "<leader>sm", "<CMD>Telescope man_pages<CR>", desc = "Man Pages" },
		-- { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "Find Help" },
		-- { "<leader>sb", "<CMD>Telescope buffers<CR>", desc = "Search Buffers" },
		-- { "<leader>sH", "<CMD>Telescope highlights<CR>", desc = "Find highlight groups" },
		-- { "<leader>sC", "<CMD>Telescope commands<CR>", desc = "Commands" },

		-- trouble
		{ "<leader>xx", "<CMD>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		{ "<leader>xt", "<CMD>Trouble todo toggle<cr>", desc = "TODO" },

		-- remote
		{ "<leader>rr", "<CMD>RemoteStart<cr>", desc = "Remote Start" },
		{ "<leader>rs", "<CMD>RemoteStop<cr>", desc = "Remote Stop" },
		{ "<leader>ri", "<CMD>RemoteInfo<cr>", desc = "Remote Info" },
		{ "<leader>rl", "<CMD>RemoteInfo<cr>", desc = "Remote Log" },

		-- copilot
		{
			mode = { "n", "v" },
			{ "<leader>a", group = "AI" },
			{ "<leader>ad", "<CMD>Copilot disable<CR>", desc = "Copilot Disable" },
			{ "<leader>ae", "<CMD>Copilot enable<CR>", desc = "Copilot Enable" },
			{ "<leader>aa", "<CMD>CopilotChatToggle<CR>", desc = "Toggle Chat" },
			{ "<leader>ae", "<CMD>CopilotChatExplain<CR>", desc = "Explain this" },
			{ "<leader>ar", "<CMD>CopilotChatExplain<CR>", desc = "Review this" },
			{ "<leader>af", "<CMD>CopilotChatFix<CR>", desc = "Fix this" },
			{ "<leader>ao", "<CMD>CopilotChatOptimize<CR>", desc = "Optimize this" },
			{ "<leader>ad", "<CMD>CopilotChatDocs<CR>", desc = "Generate docs" },
			{ "<leader>at", "<CMD>CopilotChatTests<CR>", desc = "Generate tests" },
			{ "<leader>aF", "<CMD>CopilotChatFixDiagnostic<CR>", desc = "Fix diagnostic" },
		},
	}

	which_key.setup({
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "  ", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group,
			mappings = false,
		},

		keys = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},

		win = {
			border = config.which_key_window_border, -- none, single, double, shadow
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},

		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	which_key.add(mappings)
end
