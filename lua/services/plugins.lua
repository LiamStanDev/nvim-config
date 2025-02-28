return {
	-- services installer
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = require("services.mason"),
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = require("services.lspconfig"),
		dependencies = {
			{
				"glepnir/lspsaga.nvim",
				event = "LspAttach",
				dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
				config = require("services.lspsaga"),
			},
		},
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = require("services.conform-nvim"),
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = require("services.lint-nvim"),
	},

	-- dap
	{
		"mfussenegger/nvim-dap",
		event = "BufReadPre",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			{
				"rcarriga/nvim-dap-ui",
				config = require("services.dapui"),
				dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/neodev.nvim" },
			},
		},
		init = require("services.dap").init,
		config = require("services.dap").config,
	},
}
