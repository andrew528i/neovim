return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require("nvim-treesitter.configs").setup {
      sync_install = true,
      ignore_install = {},
      ensure_installed = {},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-k>",
          node_incremental = "<C-k>",
          scope_incremental = false,
          node_decremental = "<C-j>",
        },
      },
    }
  end,
}
