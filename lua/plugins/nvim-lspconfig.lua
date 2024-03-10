local _LSP_SERVERS = {
  gopls = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "ray-x/lsp_signature.nvim",
      opts = {
        bind = true,
        handler_opts = {
          border = "rounded",
        },
        toggle_key = "<C-k>",
      }
    },
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
    }
  },
  priority = 800,
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_signature = require("lsp_signature")
    local navbuddy = require("nvim-navbuddy")
    local navic = require("nvim-navic")

    local on_attach = function(client, bufnr)
      if client.server_capabilities["documentSymbolProvider"] then
        navic.attach(client, bufnr)
      end
      navbuddy.attach(client, bufnr)
      lsp_signature.on_attach(client, bufnr)
    end

    for lsp_name, lsp_config in pairs(_LSP_SERVERS) do
      lsp_config.capabilities = capabilities
      lsp_config.on_attach = on_attach
      lspconfig[lsp_name].setup(lsp_config)
    end
  end,
}
