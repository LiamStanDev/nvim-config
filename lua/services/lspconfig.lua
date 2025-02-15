local function on_attach(client, bufnr)
	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

	local keymap = vim.keymap.set
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap("n", "ga", "<CMD>Lspsaga code_action<cr>", bufopts)
	keymap("n", "gD", "<CMD>Lspsaga peek_definition<CR>", bufopts)
	keymap("n", "gd", "<CMD>Lspsaga goto_definition<CR>", bufopts) -- Use <C-t> to jump back
	keymap("n", "gf", "<CMD>Lspsaga lsp_finder<CR>", bufopts)
	keymap("n", "gT", "<CMD>Lspsaga peek_type_definition<CR>", bufopts)
	keymap("n", "gt", "<CMD>Lspsaga goto_type_definition<CR>", bufopts)
	keymap("n", "gl", "<CMD>Lspsaga show_cursor_diagnostics<CR>", bufopts)
	keymap("n", "gb", "<CMD>Lspsaga show_buf_diagnostics<CR>", bufopts)
	keymap("n", "gh", "<CMD>Lspsaga hover_doc<CR>", bufopts)
	keymap("n", "gk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	keymap("n", "gj", "<CMD>Lspsaga diagnostic_jump_next<CR>", bufopts)
	keymap("n", "gr", "<CMD>Lspsaga rename ++project<CR>", bufopts)
	keymap("n", "go", "<CMD>Trouble symbols toggle<CR>", bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)

	if client.name == "omnisharp" then
		keymap("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>")
	end
	if client.name == "clangd" then
		client.server_capabilities.signatureHelpProvider = false
	end

	-- remove default formatter
	-- for rust
	vim.g.rustfmt_autosave = false
end

return function()
	-- -----------------------------------
	-- ----------- capabilities ----------
	-- -----------------------------------
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- html-lsp need this
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- nvim-ufo need this
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	-- --------------------------------------
	-- ------- register lsp service ---------
	-- --------------------------------------
	local servers = require("core.globals").lsp_servers
	for _, server in ipairs(servers) do
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- find services.lsp-settings/*
		local require_ok, conf_opts = pcall(require, "services.lsp-settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		if server == "tailwindcss-language-server" then
			require("lspconfig").tailwindcss.setup({})
			goto continue
			return
		else
			require("lspconfig")[server].setup(opts)
		end
		::continue::
	end
end
