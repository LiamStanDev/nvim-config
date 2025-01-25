local M = {}
function M.config()
	vim.o.foldcolumn = "1" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
	vim.o.foldenable = true

	require("ufo").setup({
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	})
end

M.init = function()
	-- press z the which key will show more information
	-- za toggle fold
	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
end

return M
