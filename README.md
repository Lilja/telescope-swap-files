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

### Usage
```
:Telescope uniswapfiles telescope_swap_files
```

### Demo
![image](https://github.com/Lilja/telescope-swap-files/assets/6134511/2963772b-51f3-4842-bacf-62668a0a60f2)
