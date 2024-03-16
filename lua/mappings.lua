local utils = require("utils")

-- lsp client
vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "Go to LSP definition" })
vim.keymap.set({ "n", "v" }, "gr", vim.lsp.buf.rename, { desc = "Rename LSP symbol" })
vim.keymap.set({ "n", "v" }, "gh", vim.lsp.buf.hover, { desc = "Hover LSP symbol" })
vim.keymap.set({ "n", "v" }, "gf", vim.lsp.buf.format, { desc = "Format LSP buffer" })
vim.keymap.set({ "n", "v" }, "ga", vim.lsp.buf.code_action, { desc = "Code actions LSP" })

-- command mode with no shift
vim.keymap.set({ "n", "v" }, ";", ":")

-- quit vim easily
vim.keymap.set({ "n", "v" }, "qa", "<cmd>qa<cr>")

-- close window
vim.keymap.set({ "n", "v" }, "qw", "<C-w>q")

-- split window vertically
vim.keymap.set({ "n", "v" }, "vv", "<C-w>v")

-- delete all buffers
vim.keymap.set({ "n", "v" }, "qB", utils.delete_all_buffers, { desc = "Close all buffers" })

-- tabs
vim.keymap.set({ "n", "v" }, "tt", function () vim.cmd("tabnew") end, { desc = "New tab" })
vim.keymap.set({ "n", "v" }, "qt", function () vim.cmd("tabclose") end, { desc = "Close tab" })
vim.keymap.set({ "n", "v" }, "qb", function () vim.cmd("windo bd") end, { desc = "Close tab buffers" })

