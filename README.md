# MBX.nvim

This plugin provides mbx's highlights and lsp.

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
