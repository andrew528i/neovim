return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",          desc = "Files",              silent = true },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",           desc = "Grep string" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",             desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope command_history<cr>",     desc = "Command history" },
    { "<leader>fp", "<cmd>Telescope projects<cr>",            desc = "Projects" },

    { "<leader>i",  "<cmd>Telescope lsp_implementations<cr>", desc = "LSP implementations" },
    { "<leader>r",  "<cmd>Telescope lsp_references<cr>",      desc = "LSP references" },
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer
            },
            n = {
              ["<C-d>"] = actions.delete_buffer
            }
          }
        }
      }
    }
  end,
}
