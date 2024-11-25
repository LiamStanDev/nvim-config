return function()
	local formatters = require("core.globals").formatter_services
	require("conform").setup({
		formatters_by_ft = formatters,
	})
end
