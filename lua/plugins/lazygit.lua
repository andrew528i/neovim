return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>",            desc = "Open lazygit" },
    { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open lazygit file" },
  },
}
