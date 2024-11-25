local M = {}
-- setup diagnostic ui
M.signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(M.signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" }, -- show diagnostic after your code
	signs = {
		active = M.signs, -- show signs
	},
	update_in_insert = true,
	underline = true, -- underline for diagnostic
	severity_sort = true,
	float = {
		-- the diagnostic window
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

return M
