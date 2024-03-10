return {
  "williamboman/mason.nvim",
  priority = 900,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "gopls", "pyright", "rust_analyzer" },
      automatic_installation = true,
    }
  end,
}

