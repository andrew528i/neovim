return {
  "L3MON4D3/LuaSnip",
  priority = 900,
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "honza/vim-snippets",
  },
  config = function ()
    local ls = require("luasnip")
    local opts = { silent = true }

    -- load vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- load snipmate snippets
    require("luasnip.loaders.from_snipmate").lazy_load()

    -- mappings for insert mode
    vim.keymap.set("i", "<C-k>", function() ls.expand() end, opts)
    vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, opts)
    vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, opts)
    vim.keymap.set({ "i", "s" }, "<C-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, opts)
  end
}

