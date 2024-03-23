return {
  "nvim-neotest/neotest",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup {
      adapters = {
        require("neotest-go")({
          experimental = {
            test_table = true,
          },
        }),
        require('neotest-jest')({
          jestCommand = "npx jest --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = false },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        }),
      }
    }

    vim.keymap.set("n", "<leader>tn", neotest.run.run, { desc = "Run nearest" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run file" })
    vim.keymap.set("n", "<leader>ts", "<cmd>Neotest stop<cr>", { desc = "Stop" })
    vim.keymap.set("n", "<leader>to", "<cmd>Neotest output<cr>", { desc = "Floating output" })
    vim.keymap.set("n", "<leader>tO", "<cmd>Neotest output-panel<cr>", { desc = "Output panel" })
    vim.keymap.set("n", "<leader>ti", "<cmd>Neotest summary<cr>", { desc = "Summary" })
  end,
}
