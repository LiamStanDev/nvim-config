local M = {}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local utils = require("tools.utils")

	cmp.setup({
		active = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- preselect = cmp.PreselectMode.None,
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-.>"] = cmp.mapping.complete(),
			["<C-c>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					-- if luasnip.locally_jumpable(1) then
					-- 	luasnip.jump(1)
					-- else
					cmp.confirm({ select = true })
					-- end
					-- elseif luasnip.locally_jumpable(1) then
					-- 	luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			-- ["<S-Tab>"] = cmp.mapping(function(fallback)
			-- 	if luasnip.locally_jumpable(-1) then
			-- 		luasnip.jump(-1)
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, { "i", "s" }),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = utils.format_colorful,
		},
		sources = {
			{ name = "nvim_lsp", group_index = 2 },
			{ name = "copilot", group_index = 2 },
			{ name = "path" },
			{ name = "luasnip", group_index = 2 },
			{ name = "buffer", group_index = 3 },
			{ name = "nvim_lua", group_index = 3 },
			{ name = "render-markdown", group_index = 2 },
		},
		confirm_opts = {
			-- behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = utils.window_setup().completion,
			documentation = utils.window_setup().documentation,
		},
		-- experimental = {
		-- 	ghost_text = false,
		-- 	native_menu = false,
		-- },
		sorting = {
			priority_weight = 2,
			comparators = {
				require("copilot_cmp.comparators").prioritize,

				-- Below is the default comparitor list and order for nvim-cmp
				cmp.config.compare.offset,
				-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	-- vim-dadbob
	cmp.setup.filetype({ "sql" }, {
		sources = {
			{ name = "vim-dadbod-completion" },
			{ name = "buffer" },
		},
	})
	cmp.setup({
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
	})
	cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "fuzzy_path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})
	cmp.setup.cmdline("@", {
		sources = cmp.config.sources({
			{
				name = "cmdline-prompt",
				option = {
					-- excludes = { "file", "dir" }, -- complete with 'hrsh7th/cmp-path' instead of 'cmdline-prompt'
				},
			},
			{ name = "path" },
		}),
	})
end

return M
