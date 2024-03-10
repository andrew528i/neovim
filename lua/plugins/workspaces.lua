return {
  "natecraddock/workspaces.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("workspaces").setup {
      hooks = {
        open = { "SessionRestore" },
      },
    }
    require("telescope").load_extension("workspaces")
  end,
  keys = {
    { "<leader>pa", "<cmd>WorkspacesAdd<cr>",        desc = "Add" },
    { "<leader>pd", "<cmd>WorkspacesRemove<cr>",     desc = "Delete" },
    { "<leader>pl", "<cmd>Telescope workspaces<cr>", desc = "List" },
  },
}
