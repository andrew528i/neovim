local _LSP_SERVERS = {
  gopls = {
    cmd = { "gopls" },
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        completeUnimported = true,
        usePlaceholders = false,
        diagnosticsDelay = '300ms',
      },
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
        completion = {
          callSnippet = "Replace"
        },
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        {
          "SmiteshP/nvim-navic",
          priority = 900,
          opts = {
            lsp = { auth_attach = true },
          },
        },
        "MunifTanjim/nui.nvim",
      },
      keys = {
        { "<leader>b", "<cmd>Navbuddy<cr>", mode = { "n", "v" }, desc = "Nav buddy" },
      },
    },
    {
      "folke/neodev.nvim",
      opts = {},
    },
  },
  priority = 800,
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local navbuddy = require("nvim-navbuddy")
    local navic = require("nvim-navic")

    local on_attach = function(client, bufnr)
      if client.server_capabilities["documentSymbolProvider"] then
        navic.attach(client, bufnr)
      end
      navbuddy.attach(client, bufnr)
    end

    for lsp_name, lsp_config in pairs(_LSP_SERVERS) do
      lsp_config.capabilities = capabilities
      lsp_config.on_attach = on_attach
      lspconfig[lsp_name].setup(lsp_config)
    end
  end,
}
