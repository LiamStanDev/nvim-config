-- set conf as file type conf
vim.api.nvim_command("autocmd BufNewFile,BufRead *.conf setfiletype conf")
vim.api.nvim_command("autocmd BufNewFile,BufRead justfile setfiletype make")

-- linter
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
