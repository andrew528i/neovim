return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,

        -- -- null_ls.builtins.completion.tags,

        -- null_ls.builtins.diagnostics.buf,
        -- null_ls.builtins.diagnostics.codespell,
        -- null_ls.builtins.diagnostics.fish,
        -- null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.diagnostics.hadolint,
        -- null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.solhint,

        -- null_ls.builtins.formatting.biome,
        -- null_ls.builtins.formatting.buf,
        -- null_ls.builtins.formatting.codespell,
        -- null_ls.builtins.formatting.gofumpt,
        -- null_ls.builtins.formatting.goimports_reviser,
        -- null_ls.builtins.formatting.markdownlint,
        -- null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
