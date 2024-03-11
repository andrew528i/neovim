return {
  "williamboman/mason.nvim",
  priority = 900,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = {},
      auto_install = true,
      automatic_installation = true,
    }
  end,
}
