local M = {}

function M.setup()
	local ok, parsers = pcall(require, "nvim-treesitter.parsers")
	if not ok then
		vim.notify("Mbx: Not found nvim-treesitter", vim.log.levels.WARN)
		return
	end

	local parser_config = parsers.get_parser_configs()

	parser_config.mbx = {
		install_info = {
			url = "https://github.com/aitne-dev/tree-sitter-mbx",
			files = { "src/parser.c", "src/scanner.c" },
			branch = "main",
		},
		filetype = "mbx",
	}
end

return M
