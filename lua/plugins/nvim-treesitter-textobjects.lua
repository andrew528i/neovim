return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["am"] = { query = "@function.outer", desc = "Function outer" },
            ["im"] = { query = "@function.inner", desc = "Function innter" },

            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

            ["ap"] = { query = "@parameter.outer", desc = "Parameter outer" },
            ["ip"] = { query = "@parameter.inner", desc = "Parameter inner" },

            ["ac"] = { query = "@call.outer", desc = "Call outer" },
            ["ic"] = { query = "@call.inner", desc = "Call inner" },

            ["ab"] = { query = "@block.outer", desc = "Select outer block" },
            ["ib"] = { query = "@block.inner", desc = "Select inner block" },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>np"] = { query = "@parameter.inner", desc = "Swap parameter with next" },
            ["<leader>nm"] = { query = "@function.outer", desc = "Swap function with next" },
          },
          swap_previous = {
            ["<leader>pp"] = { query = "@parameter.inner", desc = "Swap parameter with previous" },
            ["<leader>pm"] = { query = "@function.outer", desc = "Swap function with previous" },
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = { query = "@function.outer", desc = "Next function start" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            ["]p"] = { query = "@parameter.inner", desc = "Next argument" },
          },
          goto_next_end = {
            ["]M"] = { query = "@function.outer", desc = "Next function end" },
            ["]P"] = { query = "@parameter.inner", desc = "Next argument end" },
          },
          goto_previous_start = {
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[p"] = { query = "@parameter.inner", desc = "Prev argument" },
            ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
            ["[P"] = { query = "@parameter.inner", desc = "Prev argument end" },
          },
        },
      },
    }
  end,
}
