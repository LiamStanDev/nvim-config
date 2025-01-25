local function on_attach(client, bufnr)
	local keymap = vim.keymap.set

	vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

	if client.name == "omnisharp" then
		keymap("n", "gd", "<cmd>lua require('omnisharp_extended').lsp_definitions()<cr>")
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
