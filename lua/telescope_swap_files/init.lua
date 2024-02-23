local function scandir(directory)
	local t, popen = {}, io.popen
	local pfile = popen('ls -a "' .. directory .. '"')
	if pfile == nil then
		return {}
	end
	for filename in pfile:lines() do
		if filename ~= "." and filename ~= ".." then
			-- TODO: Fix linux support
			local f = io.popen("date -r " .. directory .. filename .. " +%s")
			if f == nil then
				print("No output to stat cmd")
				return 1
			end
			local last_modified = f:read()
      -- date returns time in unix epoch format
			table.insert(t, { filename, os.date("%c", last_modified) })
		end
	end
	pfile:close()
	return t
end

-- return function()
function Hello()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local previewers = require("telescope.previewers")
	local conf = require("telescope.config").values
	local dir = vim.opt.directory._value
	local f = scandir(dir)

	local presentSwapFileDir = function(opts)
		opts = opts or {}
		pickers
			.new(opts, {
				previewer = previewers.new_buffer_previewer({
					title = "Swap preview",
					define_preview = function(self, entry, status)
						vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, {
							"Last modified",
							entry["value"][2],
							"",
							"Original file name",
							entry["value"][1],
						})
					end,
				}),
				prompt_title = "Neovim swap files",
				finder = finders.new_table({
					results = f,
					entry_maker = function(entry)
						return {
							value = entry,
							-- % needs to be escaped with, you might've guessed it. Another %.
							display = entry[1]:gsub("%%", "/"),
							ordinal = entry[1],
						}
					end,
				}),
				sorter = conf.generic_sorter(opts),
				--[[
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						print(vim.inspect(selection))
						-- print(vim.inspect(selection))
						-- vim.api.nvim_put({ selection[1] }, "", false, true)
					end)
					return true
				end,
				--]]
			})
			:find()
	end
	presentSwapFileDir()
end
