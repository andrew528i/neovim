return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    vim.opt.timeout = true
    vim.opt.timeoutlen = 500

    wk.setup {}
    wk.register {
      ["<leader>f"] = {
        name = "Find",
      },
      ["<leader>g"] = {
        name = "Git",
      },
      ["<leader>p"] = {
        name = "Projects",
      },
    }
  end,
}

