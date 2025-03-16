return {
	enabled = true,
	sections = {
		-- { section = "header" },

		{
			pane = 1,
			section = "terminal",
			-- cmd = "pokemon-colorscripts -n zacian --no-title; sleep .1",
			cmd = "pokemon-colorscripts -n quagsire --no-title; sleep .1",
			-- random = 10,
			indent = 15,
			height = 20,
		},

		{
			pane = 1,
			-- icon = " ",
			-- title = "Git Status",
			section = "terminal",
			enabled = function()
				return Snacks.git.get_root() ~= nil
			end,
			cmd = "git status --short --branch --renames",
			height = 5,
			padding = 1,
			ttl = 5 * 60,
			indent = 12,
		},
		{ section = "startup", padding = 1 },

		{
			pane = 2,
			section = "keys",
			gap = 1,
			padding = 1,
		},

		{
			pane = 2,
			icon = " ",
			desc = "Browse Repo",
			padding = 1,
			key = "b",
			action = function()
				Snacks.gitbrowse()
			end,
		},

		{
			pane = 2,
			icon = " ",
			title = "Recent Files",
			section = "recent_files",
			indent = 2,
			padding = 1,
		},

		{
			pane = 2,
			icon = " ",
			title = "Projects",
			section = "projects",
			indent = 2,
			padding = 1,
		},
	},
}
