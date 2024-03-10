return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  config = function ()
    require("gitsigns").setup {}
  end,
  keys = {
    { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next git hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous git hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", mode = { "n", "v" }, desc = "Reset hunk" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", mode = { "n", "v" }, desc = "Reset buffer" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", mode = { "n", "v" }, desc = "Preview hunk" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", mode = { "n", "v" }, desc = "Blame" },
  },
}

