local M = {}

local function detect_project_type()
	if vim.fn.glob("CMakeLists.txt") ~= "" then
		return "cpp"
	elseif vim.fn.glob("*.py") ~= "" then
		return "python"
	elseif vim.fn.glob("Cargo.toml") ~= "" then
		return "rust"
	else
		return nil
	end
end

function M.open_task_menu(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local Terminal = require("toggleterm.terminal").Terminal
	local generic_sorter = require("telescope.config").values.generic_sorter

	local project_type = detect_project_type() or ""
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
					Terminal:new({
						display_name = "task-runner",
						cmd = selection.value.command,
						close_on_exit = false,
						direction = "horizontal",
					}):toggle()
				end)
				map("i", "<ESC>", actions.close)
				return true
			end,
		})
		:find()
end

return M
