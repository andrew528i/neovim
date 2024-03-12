local plugins = {
  require("plugins.auto-save"),
  require("plugins.auto-session"),
  require("plugins.barbar"),
  require("plugins.comment"),
  require("plugins.dashboard-nvim"),
  require("plugins.fidget"),
  require("plugins.gitsigns"),
  require("plugins.heirline"),
  require("plugins.hlslens"),
  require("plugins.hop"),
  require("plugins.luasnip"),
  require("plugins.mason"),
  require("plugins.mini-bracketed"),
  require("plugins.mini-bufremove"),
  require("plugins.mini-indentscope"),
  require("plugins.mini-jump"),
  require("plugins.mini-move"),
  require("plugins.mini-pairs"),
  require("plugins.mini-trailspace"),
  require("plugins.modes"),
  require("plugins.neo-tree"),
  require("plugins.neoscroll"),
  require("plugins.noice"),
  require("plugins.nvim-cmp"),
  require("plugins.nvim-lspconfig"),
  require("plugins.nvim-scrollbar"),
  require("plugins.nvim-surround"),
  require("plugins.nvim-treesitter"),
  require("plugins.nvim-treesitter-textobjects"),
  require("plugins.nvim-ufo"),
  require("plugins.nvim-various-textobjs"),
  require("plugins.none-ls"),
  require("plugins.telescope"),
  require("plugins.theme"),
  require("plugins.todo-comments"),
  require("plugins.treesj"),
  require("plugins.true-zen"),
  require("plugins.vim-fugitive"),
  require("plugins.vim-lastplace"),
  require("plugins.which-key"),
  require("plugins.workspaces"),
}

local opts = {
  install = {
    colorscheme = { "tokyonight-night" }
  }
}

require("lazy").setup(plugins, opts)
