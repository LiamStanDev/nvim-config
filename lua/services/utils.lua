local M = {}

function M.append_lists(list1, list2)
	for _, value in ipairs(list2) do
		table.insert(list1, value)
	end
end

function M.get_service_identifiers(config)
	local mappings = require("services.mappings")
	local packages = {}
	local packages_seen = {}

	-- Add LSP servers
	for _, server in ipairs(config.lsp_servers) do
		local pkg = mappings.lspconfig_to_package[server]
		if pkg and not packages_seen[pkg] then
			table.insert(packages, pkg)
			packages_seen[pkg] = true
		end
	end

	-- Add formatter services
	for _, servers in pairs(config.formatter_services) do
		for _, server in ipairs(servers) do
			if type(server) == "string" then
				local pkg = mappings.conform_to_package[server]
				if pkg and not packages_seen[pkg] then
					table.insert(packages, pkg)
					packages_seen[pkg] = true
				end
			end
		end
	end

	-- Add linting services
	for _, servers in pairs(config.linting_services) do
		for _, server in ipairs(servers) do
			local pkg = mappings.nvimlint_to_pakcage[server]
			if pkg and not packages_seen[pkg] then
				table.insert(packages, pkg)
				packages_seen[pkg] = true
			end
		end
	end

	-- Add DAP servers
	for _, server in ipairs(config.dap_servers) do
		local pkg = mappings.dap_to_package[server]
		if pkg and not packages_seen[pkg] then
			table.insert(packages, pkg)
			packages_seen[pkg] = true
		end
	end
	return packages
end

return M
