return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    tabpages = true,
    sidebar_filetypes = {
      ["neo-tree"] = { event = 'BufWipeout' },
    },
  },
  keys = {
    { "gj", "<cmd>BufferPick<cr>", mode = { "n", "v" }, desc = "Pick buffer" },
  },
}
