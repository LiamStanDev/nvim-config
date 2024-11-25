return function()
	require("onedarkpro").setup({
		colors = {}, -- Override default colors or create your own
		highlights = {
			-- neotree color: https://github.com/loctvl842/monokai-pro.nvim/blob/master/lua/monokai-pro/theme/plugins/neo-tree.lua
			NeoTreeFileIcon = { fg = "#61AFEF" },
			NeoTreeDirectoryName = { fg = "#A3AAB7" },
			NeoTreeDirectoryIcon = { fg = "#89B4FA" },
			NeoTreeExpander = { fg = "#7D8590" },
			NeoTreeIndentMarker = { fg = "#7D8590" },
		},
		options = {
			transparency = true,
		},
	})
end
