return {
  "pocco81/true-zen.nvim",
  opts = {},
  keys = {
    { "<leader>zn", "<cmd>TZNarrow<cr>",   mode = "n",          desc = "Zen narrow" },
    { "<leader>zf", "<cmd>TZAtaraxis<cr>", mode = { "n", "v" }, desc = "Zen focus" },
    {
      "<leader>zn",
      function()
        local truezen = require("true-zen")
        local first = vim.fn.line('v')
        local last = vim.fn.line('.')
        truezen.narrow(first, last)
      end,
      mode = "v",
      desc = "Zen narrow"
    },
  },
}
