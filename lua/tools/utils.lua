local M = {}

function M.window_setup()
	local config = require("core.globals")
	if config.cmp_window_border == "rounded" then
		local border_opt = {
			border = "rounded", -- single, rounded
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		}
		return {
			completion = require("cmp.config.window").bordered(border_opt),
			documentation = require("cmp.config.window").bordered(border_opt),
		}
	end
	if config.cmp_window_border == "single" then
		local border_opt = {
			border = "single", -- single, rounded
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
		}
		return {
			completion = require("cmp.config.window").bordered(border_opt),
			documentation = require("cmp.config.window").bordered(border_opt),
		}
	end
	return {
		completion = require("cmp.config.window"),
		documentation = require("cmp.config.window"),
	}
end

function M.format_colorful(entry, item)
	local lspkind = require("lspkind").cmp_format({
		mode = "symbol_text",
		maxwidth = {
			abbr = 30,
			menu = 40,
		},
		ellipsis_char = "...",
		show_labelDetails = true,
	})(entry, item)
	local strings = vim.split(lspkind.kind, "%s", { trimempty = true })
	-- print(vim.inspect(strings))
	-- print(vim.inspect(item.menu))
	item.kind = " " .. (strings[1] or "") .. " "
	item.menu = item.menu

	return item
end

local function detect_project_type()
	local filetype = vim.bo.filetype
	if vim.fn.filereadable("CMakeLists.txt") == 1 then
		return "cpp_cmake"
	elseif filetype == "cpp" then
		return "cpp"
	elseif
		vim.fn.filereadable("pyproject.toml") == 1
		or vim.fn.filereadable("setup.py") == 1
		or vim.fn.filereadable("requirements.txt") == 1
		or filetype == "python"
	then
		return "python"
	elseif
		vim.fn.filereadable("Cargo.toml") == 1
		or vim.fn.filereadable("src/main.rs") == 1
		or vim.fn.filereadable("src/lib.rs") == 1
	then
		return "rust"
	elseif vim.fn.filereadable("package.json") == 1 then
		return "javascript"
	elseif vim.fn.filereadable("go.mod") == 1 or filetype == "go" then
		return "go"
	elseif vim.fn.filereadable("pom.xml") == 1 or vim.fn.filereadable("build.gradle") == 1 or filetype == "java" then
		return "java"
	else
		return nil
	end
end

function M.open_task_menu(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local generic_sorter = require("telescope.config").values.generic_sorter

	local project_type = detect_project_type() or ""
	vim.notify(project_type)
	local tasks = require("tasks")[project_type] or {}

	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Select Task",
			finder = finders.new_table({
				results = tasks,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.label,
						ordinal = entry.label,
					}
				end,
			}),
			sorter = generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local user_cmd = vim.fn.input("command: ", selection.value.command)
					local cmd = string.format('TermExec cmd="%s" dir=%s', user_cmd, vim.fn.getcwd())
					vim.cmd(cmd)
				end)
				map("i", "<ESC>", actions.close)
				return true
			end,
		})
		:find()
end

return M
