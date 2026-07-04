local M = {}

local function mbx_diagnostic_handler(err, result, ctx, config)
	if result and result.diagnostics then
		local filtered = {}
		for _, diagnostic in ipairs(result.diagnostics) do
			local msg = diagnostic.message or ""
			local is_jsx_error = msg:match("expected") and msg:match("<")
				or msg:match("unexpected token") and msg:match("<")
				or msg:match("parse error")

			if not is_jsx_error then
				table.insert(filtered, diagnostic)
			end
		end
		result.diagnostics = filtered
	end

	vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
end

function M.setup(opts)
	local ok, lspconfig = pcall(require, "lspconfig")
	if not ok then
		return
	end

	local configs = require("lspconfig.configs")

	if not configs.mbx_lsp then
		configs.mbx_lsp = {
			default_config = {
				cmd = opts.cmd or { "moonbit-lsp" },
				filetypes = { "mbx" },
				root_dir = lspconfig.util.root_pattern("moon.mod", ".git"),
				single_file_support = true,
			},
		}
	end

	lspconfig.mbx_lsp.setup({
		filetypes = { "mbx" },
		on_attach = opts.on_attach,
		capabilities = opts.capabilities,
		handlers = {
			["textDocument/publishDiagnostics"] = vim.lsp.with(mbx_diagnostic_handler, {}),
		},
	})
end

return M
