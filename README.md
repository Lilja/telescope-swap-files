# telescope-swap-files

This plugin provides a Telescope picker for swap files given a file path, if you have configured `vim.opt.directory` to be the directory that neovim places your swap files in.
It also includes a custom preview window that shows the last modified time of the swap file, along the original file name.

## Installation

Add it to the dependencies of `telescope.nvim`:

```lua
use {
  "nvim-telescope/telescope.nvim",
  dependencies = {
      'Lilja/telescope-swap-files',
  }
}
```

Then make telescope load the extension

```lua
require('telescope').load_extension('uniswapfiles')
```
