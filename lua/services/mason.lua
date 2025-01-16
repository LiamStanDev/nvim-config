return function()
	require("mason").setup({
		-- - "prepend" (default, Mason's bin location is put first in PATH)
		-- - "append" (Mason's bin location is put at the end of PATH)
		-- - "skip" (doesn't modify PATH)
		PATH = "prepend",
		pip = {
			-- upgrade pip in the virtual environment before installing packages.
			upgrade_pip = false,
		},
	})

	local config = require("core.globals")
	local services = require("services.utils").get_mason_packages(config)
	-- print(vim.inspect(services))

	require("mason-tool-installer").setup({
		ensure_installed = services,
		auto_update = true,
		-- run_on_start = true,
		-- debounce_hours = 5,
		integrations = {
			["mason-lspconfig"] = true,
			["mason-null-ls"] = false,
			["mason-nvim-dap"] = true,
		},
	})

	-- local servers = require("core.globals").lsp_servers
end
