local M = {}

M.get_mason_packages = function(config)
	local packages = {}
	local seen = {}

	-- Add LSP servers
	for _, server in ipairs(config.lsp_servers) do
		if not seen[server] then
			table.insert(packages, server)
			seen[server] = true
		end
	end

	-- Add formatter services
	for _, formatters in pairs(config.formatter_services) do
		for _, formatter in ipairs(formatters) do
			if type(formatter) == "string" then
				if formatter:find("ruff") then
					formatter = "ruff"
				end
				if formatter == "clang_format" then
					formatter = "clang-format"
				end
				if not seen[formatter] then
					table.insert(packages, formatter)
					seen[formatter] = true
				end
			end
		end
	end

	-- Add linting services
	for _, linters in pairs(config.linting_services) do
		for _, linter in ipairs(linters) do
			if not seen[linter] then
				table.insert(packages, linter)
				seen[linter] = true
			end
		end
	end

	-- Add DAP servers
	for _, server in ipairs(config.dap_servers) do
		if not seen[server] then
			table.insert(packages, server)
			seen[server] = true
		end
	end

	return packages
end

return M
