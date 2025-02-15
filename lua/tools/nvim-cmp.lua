local M = {}

local function cmdline_mapping()
	local cmp = require("cmp")
	-- ref: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/mapping.lua
	return cmp.mapping.preset.cmdline({
		["<TAB>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				else
					fallback()
				end
			end,
		},
		["<C-j>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
		},
		["<C-k>"] = {
			c = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
		},
	})
	-- return cmp.mapping.preset.cmdline()
end

local function insert_mapping()
	local cmp = require("cmp")
	-- ref: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/mapping.lua
	return cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-.>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			else
				fallback()
			end
		end, { "i", "s" }),
	})
end

function M.config()
	local cmp = require("cmp")
	local utils = require("tools.utils")

	cmp.setup({
		active = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- preselect = cmp.PreselectMode.None,
		mapping = insert_mapping(),
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
		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.kind,
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
		mapping = cmdline_mapping(),
		-- mappings = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmdline_mapping(),
		-- mappings = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline" },
			{ name = "path" },
		}),
	})
	cmp.setup.cmdline("@", {
		mapping = cmdline_mapping(),
		-- mappings = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline-prompt" },
			{ name = "path" },
		}),
	})
end

return M
