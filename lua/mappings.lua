-- lsp client
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to LSP definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.rename, { desc = "Rename LSP symbol" })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Hover LSP symbol" })
vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "Format LSP buffer" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions LSP" })

-- command mode with no shift
vim.keymap.set({ "n", "v" }, ";", ":")

-- easy way to quit all
vim.keymap.set({ "n", "v" }, "qa", "<cmd>qa<cr>")
