return {
	-- utils
	{ "nvim-lua/popup.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = require("ui.alpha"),
	},

	-- lsp ui
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
		config = require("ui.lspsaga"),
	},

	-- dap ui
	{
		"rcarriga/nvim-dap-ui",
		config = require("ui.dapui"),
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/neodev.nvim" },
	},

	-- explore
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VeryLazy",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
			},
		},
		config = require("ui.neotree"),
	},
	-- {
	-- 	"echasnovski/mini.files",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("ui.mini-files").setup()
	-- 	end,
	-- },

	-- status line
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy", config = require("ui.lualine") },

	-- buffer tab
	{ "akinsho/bufferline.nvim", config = require("ui.bufferline") },

	-- for select and input ui
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = require("ui.dressing"),
	},

	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim", -- for command line pop window and nottify
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				event = "VeryLazy",
				config = require("ui.notify"),
			},
		},
		config = require("ui.noice"),
	},

	-- copilot chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {},
		config = require("ui.copilot-chat"),
	},

	-- toggle term
	-- { "akinsho/toggleterm.nvim", version = "*", config = require("ui.toggleterm") },
}
