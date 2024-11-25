return function()
	require("catppuccin").setup({
		transparent_background = true,
		no_italic = true,

		custom_highlights = {
			NeoTreeFileIcon = { fg = "#6DC85E" },
			NeoTreeDirectoryName = { fg = "#A3AAB7" },
			-- NeoTreeDirectoryIcon = { fg = "#89B4FA" },
			NeoTreeDirectoryIcon = { fg = "#868687" },
			NeoTreeExpander = { fg = "#7D8590" },
			NeoTreeIndentMarker = { fg = "#7D8590" },
			-- indent scope
			MiniIndentscopeSymbol = { fg = "#BA7ACE" },
			-- trouble
			TroubleIconDirectory = { fg = "#868687" },
			TroubleIconFile = { fg = "#6DC85E" },
			PmenuSel = { bg = "#282C34", fg = "NONE" },
			Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

			CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
			CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
			CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
			CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },
			CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
			CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
			CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
			CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
			CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
			CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
			CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
			CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
			CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
			CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
			CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
			CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
			CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
			CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
			CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
			CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
			CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
			CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
			CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
			CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
			CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
			CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
			CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
			CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
			CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
		},

		integrations = {
			barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
			cmp = true,
			gitsigns = true,
			hop = true,
			illuminate = { enabled = true },
			native_lsp = { enabled = true, inlay_hints = { background = true } },
			neogit = true,
			neotree = true,
			semantic_tokens = true,
			treesitter = true,
			treesitter_context = true,
			vimwiki = true,
			which_key = true,
		},
		color_overrides = {
			mocha = {
				-- rosewater = "#ea6962",
				-- flamingo = "#ea6962",
				-- red = "#ea6962",
				-- maroon = "#ea6962",
				-- pink = "#d3869b",
				-- mauve = "#d3869b",
				-- peach = "#e78a4e",
				-- yellow = "#d8a657",
				-- green = "#a9b665",
				-- teal = "#89b482",
				-- sky = "#89b482",
				-- sapphire = "#89b482",
				-- blue = "#7daea3",
				-- lavender = "#7daea3",
				--
				-- text = "#bdae93",
				-- -- text = "#ebdbb2",
				-- subtext1 = "#d5c4a1",
				-- subtext0 = "#bdae93",
				-- overlay2 = "#a89984",
				-- overlay1 = "#928374",
				-- overlay0 = "#595959",
				-- surface2 = "#4d4d4d",
				-- surface1 = "#404040",
				-- surface0 = "#292929",
				-- base = "#1d2021",
				-- mantle = "#191b1c",
				-- crust = "#141617",
			},
		},
	})
end