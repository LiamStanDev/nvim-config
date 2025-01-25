local M = {}

function M.open_compile_menu(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local Terminal = require("toggleterm.terminal").Terminal
	local generic_sorter = require("telescope.config").values.generic_sorter
	local config = require("core.globals")

	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Select Compile Option",
			finder = finders.new_table({
				results = config.tasks,
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
