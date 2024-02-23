print("Loading telescope_swap_files")

return require("telescope").register_extension({
	setup = function(ext_config, config)
		-- access extension config and user config
		print("Registered telescope_swap_files with config")
	end,
	exports = {
		telescope_swap_files = require("telescope_swap_files"),
	},
})
