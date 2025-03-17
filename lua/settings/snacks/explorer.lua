local map = vim.keymap.set
map("n", "<leader>e", function()
	Snacks.picker.explorer({ hidden = true })
end, { desc = "Explorer" })

return {
	enabled = true,
}
