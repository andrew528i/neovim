return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Function outer" },
            ["if"] = { query = "@function.inner", desc = "Function innter" },

            ["aa"] = { query = "@parameter.outer", desc = "Parameter outer" },
            ["ia"] = { query = "@parameter.inner", desc = "Parameter inner" },

            ["ac"] = { query = "@call.outer", desc = "Call outer" },
            ["ic"] = { query = "@call.inner", desc = "Call inner" },

            ["ab"] = { query = "@block.outer", desc = "Select outer block" },
            ["ib"] = { query = "@block.inner", desc = "Select inner block" },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = { query = "@parameter.inner", desc = "Swap parameter with next" },
            ["<leader>nf"] = { query = "@function.outer", desc = "Swap function with next" },
          },
          swap_previous = {
            ["<leader>pa"] = { query = "@parameter.inner", desc = "Swap parameter with previous" },
            ["<leader>pf"] = { query = "@function.outer", desc = "Swap function with previous" },
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "Next function start" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            ["]a"] = { query = "@parameter.inner", desc = "Next argument" },
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "Next function end" },
            ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[a"] = { query = "@parameter.inner", desc = "Prev argument" },
            ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
            ["[A"] = { query = "@parameter.inner", desc = "Prev argument end" },
          },
        },
      },
    }
  end,
}
