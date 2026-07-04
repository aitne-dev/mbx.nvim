# MBX.nvim

This plugin provides mbx's highlights.

## Installation

### Lazy:
```lua
{
  "aitne-dev/mbx.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("mbx").setup({})
  end
}
```
