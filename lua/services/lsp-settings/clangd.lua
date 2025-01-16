return {
	cmd = {
		"clangd",
		"--background-index", -- make background index for quick jump into definition
		"--clang-tidy", -- linter
		"--cross-file-rename",
		"--completion-style=bundled", -- more info when completion popup
		"--header-insertion=iwyu", -- header only insert `include whay you use`
	},
	filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda" },
}
