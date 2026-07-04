---{
---  "aitne-dev/aitne.nvim",
---  dependencies = {
---    "neovim/nvim-lspconfig",
---    "nvim-treesitter/nvim-treesitter",
---  },
---  config = function()
---    require("aitne").setup({
---      -- cmd = { "/path/to/moonbit-lsp" } 
---    })
---  end
---}

local M = {}

function M.setup(opts)
	opts = opts or {}

	require("mbx.filetype").setup()
	require("mbx.treesitter").setup()
	require("mbx.lsp").setup(opts)
end

return M
