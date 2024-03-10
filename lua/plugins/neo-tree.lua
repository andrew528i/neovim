return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      event = "VeryLazy",
      version = "2.*",
      opts = {
        hint = "floating-big-letter",
        selection_chars = "ASDFGHJKL",
      },
    },
  },
  keys = {
    { "<C-n>",      "<cmd>Neotree toggle reveal<cr>",                          mode = { "n", "v" }, desc = "Neo tree" },
    { "<leader>gs", "<cmd>Neotree float git_status<cr>",                       mode = { "n", "v" }, desc = "Status" },
    { "<C-s>",      "<cmd>Neotree position=right toggle document_symbols<cr>", mode = { "n", "v" }, desc = "Symbols" },
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true,
      filesystem = {
        window = {
          mappings = {
            ["jj"] = "test",
          }
        },
        commands = {
          test = function(state)
            -- print(vim.inspect(state))
            -- local fs = require("neo-tree.sources.filesystem")
            vim.notify(vim.inspect(state))
          end
        },
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
    }
  end
}
