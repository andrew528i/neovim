return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent_type", "Spaces",
            "--indents_width", "2"
          },
        }),
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.tags,
        -- null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.completion.vsnip,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.refactoring,
      },
    })
  end,
}
