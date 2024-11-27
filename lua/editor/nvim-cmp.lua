local M = {}

local function window_setup()
	local config = require("core.globals")
	if config.cmp_window_border == "rounded" then
		local border_opt = {
			border = "rounded", -- single, rounded
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		}
		return {
			completion = require("cmp.config.window").bordered(border_opt),
			documentation = require("cmp.config.window").bordered(border_opt),
		}
	end
	if config.cmp_window_border == "single" then
		local border_opt = {
			border = "single", -- single, rounded
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}
		return {
			completion = require("cmp.config.window").bordered(border_opt),
			documentation = require("cmp.config.window").bordered(border_opt),
		}
	end
	return {
		completion = require("cmp.config.window"),
		documentation = require("cmp.config.window"),
	}
end

local function format_colorful(entry, item)
	local lspkind = require("lspkind").cmp_format({
		mode = "symbol_text",
		maxwidth = {
			abbr = 30,
			menu = 40,
		},
		ellipsis_char = "...",
		show_labelDetails = true,
	})(entry, item)
	local strings = vim.split(lspkind.kind, "%s", { trimempty = true })
	-- print(vim.inspect(strings))
	-- print(vim.inspect(item.menu))
	item.kind = " " .. (strings[1] or "") .. " "
	item.menu = item.menu

	return item
end

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	cmp.setup({
		active = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-/>"] = cmp.mapping.complete(),
			["<C-c>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if luasnip.expandable() then
						luasnip.expand()
					else
						cmp.confirm({ select = true })
					end
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = format_colorful,
		},
		sources = {
			{ name = "nvim_lsp", group_index = 1 },
			{ name = "copilot", group_index = 2 },
			{ name = "path" },
			-- { name = "vsnip" },
			{ name = "luasnip", group_index = 2 },
			{ name = "buffer", group_index = 3 },
			{ name = "nvim_lua", group_index = 3 },
			-- { name = "nvim_lsp_signature_help" },
		},
		confirm_opts = {
			-- behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = window_setup().completion,
			documentation = window_setup().documentation,
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})

	-- vim-dadbob
	cmp.setup.filetype({ "sql" }, {
		sources = {
			{ name = "vim-dadbod-completion" },
			{ name = "buffer" },
		},
	})

	-- Add parentheses after selecting function or method
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
