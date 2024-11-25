return function()
	require("onedark").setup({
		style = "warm",
		transparent = true,

		code_style = {
			comments = "none",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},

		lualine = {
			transparent = false,
		},

		colors = {},
		highlights = {
			-- neotree
			NeoTreeFileIcon = { fg = "#6DC85E" },
			NeoTreeDirectoryName = { fg = "#A3AAB7" },
			-- NeoTreeDirectoryIcon = { fg = "#89B4FA" },
			NeoTreeDirectoryIcon = { fg = "#868687" },
			NeoTreeExpander = { fg = "#7D8590" },
			NeoTreeIndentMarker = { fg = "#7D8590" },
			-- indent scope
			MiniIndentscopeSymbol = { fg = "#BA7ACE" },
			-- indent line
			-- IBLScope = { fg = "#BA7ACE" },
			-- trouble
			TroubleIconDirectory = { fg = "#868687" },
			TroubleIconFile = { fg = "#6DC85E" },
		},
	})
end
