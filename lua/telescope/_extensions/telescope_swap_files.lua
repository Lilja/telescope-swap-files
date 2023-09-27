return require("telescope").register_extension {
  setup = function(ext_config, config)
    -- access extension config and user config
  end,
  exports = {
    telescope_swap_files = require("telescope-swap-files")()
  },
}
