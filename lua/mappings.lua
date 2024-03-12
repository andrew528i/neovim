-- lsp client
vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to LSP definition" })
vim.keymap.set({ "n", "v" }, "gr", vim.lsp.buf.rename, { desc = "Rename LSP symbol" })
vim.keymap.set({ "n", "v" }, "gh", vim.lsp.buf.hover, { desc = "Hover LSP symbol" })
vim.keymap.set({ "n", "v" }, "gf", vim.lsp.buf.format, { desc = "Format LSP buffer" })
vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { desc = "Code actions LSP" })

-- command mode with no shift
vim.keymap.set({ "n", "v" }, ";", ":")

-- easy way to quit all
vim.keymap.set({ "n", "v" }, "qa", "<cmd>qa<cr>")
vim.keymap.set({ "n", "v" }, "qw", "<C-w>q")
vim.keymap.set({ "n", "v" }, "vv", "<C-w>v")
