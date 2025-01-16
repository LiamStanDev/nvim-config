return {
	-- services installer
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = require("services.mason"),
		dependencies = {
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				event = "VeryLazy",
				dependencies = {
					-- mason tool installer need this to parse name to mason name
					"williamboman/mason-lspconfig.nvim",
					"jay-babu/mason-nvim-dap.nvim",
				},
			},
		},
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			-- {
			-- 	"ray-x/lsp_signature.nvim",
			-- 	event = "VeryLazy",
			-- 	config = require("services.lsp-signature"),
			-- },
			-- "Hoffs/omnisharp-extended-lsp.nvim",
		},
		config = require("services.lspconfig"),
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
			-- "jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
		},
		init = require("services.dap").init,
		config = require("services.dap").config,
	},
}
