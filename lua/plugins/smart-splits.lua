return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    { "<S-A-h>", "<cmd>SmartResizeLeft<cr>",      mode = { "n", "v" }, desc = "Smart resize left" },
    { "<S-A-j>", "<cmd>SmartResizeDown<cr>",      mode = { "n", "v" }, desc = "Smart resize down" },
    { "<S-A-k>", "<cmd>SmartResizeUp<cr>",        mode = { "n", "v" }, desc = "Smart resize up" },
    { "<S-A-l>", "<cmd>SmartResizeRight<cr>",     mode = { "n", "v" }, desc = "Smart resize right" },

    { "<S-h>",   "<cmd>SmartCursorMoveLeft<cr>",  mode = { "n", "v" }, desc = "Smart move left" },
    { "<S-j>",   "<cmd>SmartCursorMoveDown<cr>",  mode = { "n", "v" }, desc = "Smart move down" },
    { "<S-k>",   "<cmd>SmartCursorMoveUp<cr>",    mode = { "n", "v" }, desc = "Smart move up" },
    { "<S-l>",   "<cmd>SmartCursorMoveRight<cr>", mode = { "n", "v" }, desc = "Smart move right" },
  },
}
