return function()
	require("mason").setup({
		-- - "prepend" (default, Mason's bin location is put first in PATH)
		-- - "append" (Mason's bin location is put at the end of PATH)
		-- - "skip" (doesn't modify PATH)
		PATH = "append",
		pip = {
			-- upgrade pip in the virtual environment before installing packages.
			upgrade_pip = false,
		},
	})

	local config = require("core.globals")
	local service_identifiers = require("services.utils").get_service_identifiers(config)
	-- vim.notify(vim.inspect(service_identifiers))

	-- your can manually update and install by MasonToolUpdateSync/MasonToolInstallSync
	require("mason-tool-installer").setup({
		ensure_installed = service_identifiers,
	})
end
