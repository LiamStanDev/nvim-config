return {
	-- fcitx
	-- { "h-hg/fcitx.nvim", event = "InsertEnter" },

	-- auto autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("editor.autopairs") },

	-- comment
	{ "numToStr/Comment.nvim", event = { "BufNewFile", "BufReadPre" }, config = require("editor.comment") },

	-- indnet line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.indentline"),
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		init = require("editor.indentscope").init,
		config = require("editor.indentscope").config,
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			-- "rcarriga/cmp-dap",
			"onsails/lspkind.nvim",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				config = require("editor.luasnippet"),
			},
		},
		config = require("editor.nvim-cmp").config,
	},

	-- copilot
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = require("editor.copilot"),
	-- 	dependencies = {
	--
	-- 		{
	-- 			"zbirenbaum/copilot.lua",
	-- 			cmd = "Copilot",
	-- 			event = "InsertEnter",
	-- 		},
	-- 	},
	-- },

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("editor.treesitter"),
		dependencies = {
			{

				"windwp/nvim-ts-autotag",
				config = require("editor.autotag"),
			},
			"nvim-treesitter/nvim-treesitter-textobjects",
			"IndianBoy42/tree-sitter-just",
		},
	},

	-- navigator with tmux
	-- "christoomey/vim-tmux-navigator",

	-- code folding
	{
		"kevinhwang91/nvim-ufo",
		config = require("editor.nvim-ufo").config,
		init = require("editor.nvim-ufo").init,
		event = { "BufReadPost" },
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},

	-- left line number column segment (ufo, dap, gitsign)
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					{ text = { "%s" }, click = "v:lua.ScSa" },
				},
			})
		end,
	},

	-- surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
}
