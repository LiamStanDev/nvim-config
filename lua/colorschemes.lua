return {
	-- colorscheme
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	--        config = require("colorschemes.onedarkpro")
	-- },
	{
		"navarasu/onedark.nvim",
		config = require("colorschemes.onedark"),
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = require("colorschemes.catppuccin"),
	},
}
