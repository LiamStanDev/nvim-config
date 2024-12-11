-- the core plugins
require("core")
local config = require("core.globals")

-- -----------------------------------------------------
-- Register server
-- -----------------------------------------------------
-- tree-sitter code highlight
config.code_hight_servers = {
	"regex",
	"json",
	"javascript",
	"tsx",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"cpp",
	"make",
	"cmake",
	"rust",
	"sql",
	"just",
	"asm",
}

-- lsp server for auto completion
-- INFO: Need to manually install by mason.
config.lsp_servers = { -- see https://github.com/williamboman/mason-lspconfig.nvim
	"html",
	"jsonls",
	"lua_ls",
	"cssls",
	"pylsp",
	"bashls",
	"dockerls",
	-- "docker_compose_language_service",
	"ts_ls",
	"tailwindcss",
	"taplo", -- toml lsp
	"rust_analyzer",
	"gopls",
	"cmake",
	"clangd",
	"omnisharp",
}

-- INFO: Need to install manually install by mason
config.formatter_services = {
	lua = { "stylua" },
	python = { "black" },
	javascript = { "prettierd", "prettier", stop_after_first = true },
	typescript = { "prettierd", "prettier", stop_after_first = true },
	typescriptreact = { "prettierd", "prettier", stop_after_first = true },
	html = { "prettierd", "prettier", stop_after_first = true },
	toml = { "prettierd", "prettier", stop_after_first = true },
	json = { "prettierd", "prettier", stop_after_first = true },
	go = { "gofmt" },
	bash = { "beautysh" },
	zsh = { "beautysh" },
	shell = { "beautysh" },
	c = { "clang_format" },
	cpp = { "clang_format" },
	rust = { "rustfmt" },
	cs = { "csharpier" },
	sql = { "sqlfmt" },
}

config.linting_services = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

-- debuger server
-- INFO: Need to install manually install by mason, add in this section is not work.
config.dap_servers = {
	"python",
	"cppdbg",
	"coreclr", -- csharp
	"codelldb",
	"delve", -- go
}

-- -----------------------------------------------------
-- Others
-- -----------------------------------------------------
-- set color theme here
-- config.colorscheme = "onedark"
config.colorscheme = "catppuccin-mocha"
-- config.colorscheme = "catppuccin"

-- whether to see navigator bar in the top
config.navigator_on = true

-- set the logo. see ./lua/ui/style/header.lua
config.dashboard_logo = "AstronautSmall"

-- border style
config.cmp_window_border = "single" -- none, single, rounded
config.which_key_window_border = "none" -- none, single, double, shadow

-- show inline hint
config.open_type_hint = true -- for variable
config.open_parameter_hint = true

-- file filter for explorer(only for dotfiles)
config.filter_files = {
	".git",
	".DS_Store",
	-- ".vscode",
}

-- setup all plugin
require("plugins-setup")
