local map = vim.keymap.set
map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Explorer" })

return {
	enabled = true,
}
