local M = {}

function M.setup()
	vim.filetype.add({
		extension = {
			mbx = "mbx",
		},
	})
end

return M
