return {
  "folke/twilight.nvim",
  opts = {
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 100,
    treesitter = true,
    expand = {
      -- "function",
      "method",
      -- "table",
      -- "if_statement",
    },
    exclude = {}, -- exclude these filetypes
  },
  keys = {
    { "<leader>t", "<cmd>Twilight<cr>", desc = "Toggle twilight" },
  },
}
