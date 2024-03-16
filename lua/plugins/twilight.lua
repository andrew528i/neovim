return {
  "folke/twilight.nvim",
  opts = {
    dimming = {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = false,
    },
    context = 10,
    treesitter = true,
    expand = {
      "function_declaration",
      "method_declaration",
      "type_spec",
      "function_definition",
      "function_item",
      "function",
      "method",
      "table",
    },
    exclude = {}, -- exclude these filetypes
  },
  keys = {
    { "<leader>h", "<cmd>Twilight<cr>", desc = "Toggle twilight" },
  },
}
