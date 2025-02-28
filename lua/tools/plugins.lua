return {
	-- autopairs
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = require("tools.autopairs") },

	-- comment
	{ "numToStr/Comment.nvim", event = { "BufNewFile", "BufReadPre" }, config = require("tools.comment") },

	-- indnet
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = require("tools.indentline"),
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		init = require("tools.indentscope").init,
		config = require("tools.indentscope").config,
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"rcarriga/cmp-dap",
			"onsails/lspkind.nvim",
			"teramako/cmp-cmdline-prompt.nvim",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				config = require("tools.luasnippet"),
			},
		},
		config = require("tools.nvim-cmp").config,
	},

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = require("tools.copilot"),
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
		},
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = require("tools.treesitter"),
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				config = require("tools.autotag"),
			},
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	-- code folding
	{
		"kevinhwang91/nvim-ufo",
		config = require("tools.nvim-ufo"),
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

	-- todo comment
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = require("tools.todo-comment"),
	},

	--color show
	{
		"NvChad/nvim-colorizer.lua", -- integrated with tailwind
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("tools.colorizer")
		end,
	},

	-- move
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
	},

	-- git
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy", config = require("tools.gitsigns") },
	-- { "tpope/vim-fugitive", event = "VeryLazy" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = require("tools.neogit"),
	},

	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = {},
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown", "copilot-chat" },
				render_modes = true,
			})
		end,
	},

	-- bookmark
	{ "tomasky/bookmarks.nvim", event = "VeryLazy", config = require("tools.bookmark") },

	-- keymap ui
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = require("tools.which-key"),
		dependencies = {
			{ "echasnovski/mini.icons", version = false },
		},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		config = require("tools.telescope"),
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = require("tools.alpha"),
	},

	-- diagnostic navigation
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},

	{ "echasnovski/mini.files", version = false, config = require("tools.mini-files") },

	-- status line
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy", config = require("tools.lualine") },

	-- for select and input ui
	{
		"stevearc/dressing.nvim", -- for input, and select ui
		config = require("tools.dressing"),
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
				config = require("tools.notify"),
			},
		},
		config = require("tools.noice"),
	},

	-- toggle term
	{ "akinsho/toggleterm.nvim", version = "*", config = require("tools.toggleterm") },

	-- copilot chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		branch = "main",
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {},
		config = require("tools.copilot-chat"),
	},
}
