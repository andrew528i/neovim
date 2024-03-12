local M = {}

function M.delete_all_buffers()
  vim.cmd("%bd")
end

return M
